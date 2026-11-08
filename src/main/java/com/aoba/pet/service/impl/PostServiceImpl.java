package com.aoba.pet.service.impl;

import com.aoba.pet.entity.Post;
import com.aoba.pet.entity.Post_image;
import com.aoba.pet.mapper.PostImageMapper;
import com.aoba.pet.mapper.PostMapper;
import com.aoba.pet.service.PostService;
import com.aoba.pet.vo.PostVO;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.Collections;


@Service
public class PostServiceImpl extends ServiceImpl<PostMapper, Post> implements PostService {
    @Resource
    private PostImageMapper postImageMapper;
    @Resource
    private PostMapper postMapper;

    @Override
    public IPage<PostVO> getPostPage(Integer current,Integer size,Integer categoryId) {
        Page<PostVO> page =new Page<>(current,size);
        IPage<PostVO> result = postMapper.selectPostPage(page,categoryId);
        List<PostVO> records = result.getRecords();
        if (records !=null && !records.isEmpty()){
            List<Integer> postIds=records.stream().map(PostVO::getId).collect(Collectors.toList());
            List<Post_image> images=postImageMapper.selectList(
                    new LambdaQueryWrapper<Post_image>().in(Post_image::getPostId,postIds));
            Map<Integer,List<String>> imgMap=images.stream().collect(Collectors.groupingBy(Post_image::getPostId,Collectors.mapping(Post_image::getImageUrl,Collectors.toList())));
            records.forEach(vo -> vo.setImgList(imgMap.getOrDefault(vo.getId(),Collections.emptyList())));
        }
        return result;

//        if (postList.isEmpty()){
//            return postPage;
//        }
//
//        List<Integer> postIdList = postList.stream().map(Post::getId).collect(Collectors.toList());
//
//        LambdaQueryWrapper<Post_image> wrapper = new LambdaQueryWrapper<>();
//        wrapper.in(Post_image::getPostId,postIdList);
//        List<Post_image> imageList = postImageMapper.selectList(wrapper);
//
//        Map<Integer,List<String>> imageGroupMap = imageList.stream().collect(Collectors.groupingBy(Post_image::getPostId,Collectors.mapping(Post_image::getImageUrl,Collectors.toList())));
//
//        for (Post post : postList){
//            post.setImageUrlList(imageGroupMap.get(post.getId()));
//        }
//        return postPage;
    }

    @Override
    public List<PostVO> getPostList(Integer categoryId) {
        return postMapper.selectPostList(categoryId);
    }

    @Override
    public boolean pubilshPost(Post post) {
        boolean flag=this.save(post);
        if (!flag){
            return false;
        }
        Integer postId= post.getId();

        List<String> imageUrlList=post.getImageUrlList();
        if (imageUrlList != null && !imageUrlList.isEmpty()){
            for (String url:imageUrlList){
                if (url==null||url.trim().isEmpty()){
                    continue;
                }
                Post_image img=new Post_image();
                img.setPostId(postId);
                img.setImageUrl(url.trim());
                postImageMapper.insert(img);
            }
        }
        return true;
    }
}
