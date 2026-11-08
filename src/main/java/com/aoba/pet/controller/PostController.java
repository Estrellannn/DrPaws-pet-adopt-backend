package com.aoba.pet.controller;

import com.aoba.pet.common.Result;
import com.aoba.pet.entity.Post;
import com.aoba.pet.entity.User;
import com.aoba.pet.service.PostService;
import com.aoba.pet.service.UserService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import com.aoba.pet.vo.PostVO;

import java.util.List;

@RestController
@RequestMapping("/post")
public class PostController {
    @Resource
    private PostService postService;
    @Resource
    private UserService userService;

    @GetMapping("/list")
    public Result<IPage<PostVO>> getallpost(
            @RequestParam(defaultValue = "1") Integer current,
            @RequestParam(defaultValue = "12") Integer size,
            @RequestParam(required = false) Integer categoryId
    ){
        IPage<PostVO> page=postService.getPostPage(current,size,categoryId);
        return Result.success(page);
        //return postService.getPostList(categoryId);
    }

    @PostMapping("/publish")
    public Result<String> pubilsh(@RequestBody Post post){
        String idStr= SecurityContextHolder.getContext().getAuthentication().getName();
        Integer userId=Integer.valueOf(idStr);
        User loginUser=userService.getById(userId);
        if (loginUser==null){
            return Result.fail("登录信息失效，请重新登录");
        }
        post.setUserId(loginUser.getId().intValue());
//        post.setUsername(loginUser.getUsername());
//        post.setAvatar(loginUser.getAvatar());

        boolean flag=postService.pubilshPost(post);
        if (flag){
            return Result.success("发布成功");
        }
        return Result.fail("发布失败");
    }
}
