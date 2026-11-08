package com.aoba.pet.service;

import com.aoba.pet.entity.Post;
import com.aoba.pet.vo.PostVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface PostService extends IService<Post> {
    IPage<PostVO> getPostPage(Integer current, Integer size,Integer categoryId);

    List<PostVO> getPostList(Integer categoryId);

    boolean pubilshPost(Post post);
}
