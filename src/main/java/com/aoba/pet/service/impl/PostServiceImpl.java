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

@Service
public class PostServiceImpl extends ServiceImpl<PostMapper, Post> implements PostService {
    @Resource
    private PostImageMapper postImageMapper;
    @Resource
    private PostMapper postMapper;

    @Override
    public IPage<Post> getPostPage(Long pageNum, Long pageSize) {
        Page<Post> page =new Page<>(pageNum,pageSize);
        IPage<Post> postPage = this.page(page);
        List<Post> postList = postPage.getRecords();

        if (postList.isEmpty()){
            return postPage;
        }

        List<Integer> postIdList = postList.stream().map(Post::getId).collect(Collectors.toList());

        LambdaQueryWrapper<Post_image> wrapper = new LambdaQueryWrapper<>();
        wrapper.in(Post_image::getPostId,postIdList);
        List<Post_image> imageList = postImageMapper.selectList(wrapper);

        Map<Integer,List<String>> imageGroupMap = imageList.stream().collect(Collectors.groupingBy(Post_image::getPostId,Collectors.mapping(Post_image::getImageUrl,Collectors.toList())));

        for (Post post : postList){
            post.setImageUrlList(imageGroupMap.get(post.getId()));
        }
        return postPage;
    }

    @Override
    public List<PostVO> getPostList(Integer categoryId) {
        return postMapper.selectPostList(categoryId);
    }
}
