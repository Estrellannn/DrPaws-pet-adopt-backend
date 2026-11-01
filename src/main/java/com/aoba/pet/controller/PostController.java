package com.aoba.pet.controller;

import com.aoba.pet.entity.Post;
import com.aoba.pet.service.PostService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.aoba.pet.vo.PostVO;

import java.util.List;

@RestController
@RequestMapping("/post")
public class PostController {
    @Resource
    private PostService postService;

    @GetMapping("/list")
    public List<PostVO> getallpost(
            @RequestParam(defaultValue = "1") Long pageNum,
            @RequestParam(defaultValue = "8") Long pageSize,
            @RequestParam(required = false) Integer categoryId
    ){
        //return postService.getPostPage(pageNum,pageSize);
        return postService.getPostList(categoryId);
    }
}
