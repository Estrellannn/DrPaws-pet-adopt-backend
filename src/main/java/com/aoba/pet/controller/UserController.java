package com.aoba.pet.controller;

import com.aoba.pet.common.Result;
import com.aoba.pet.dto.LoginDTO;
import com.aoba.pet.entity.User;
import com.aoba.pet.service.UserService;
import com.aoba.pet.util.JwtUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.net.Authenticator;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @PostMapping("/login")
    public Result<String> login(@RequestBody LoginDTO loginDTO){
//        LambdaQueryWrapper<User> wrapper=new LambdaQueryWrapper<>();
//        wrapper.eq(User::getUsername,loginDTO.getUsername());
//        User user=userService.getOne(wrapper);
        User user=userService.getByUsername(loginDTO.getUsername());

        if(user==null){
            return Result.fail("用户名不存在");
        }
        if (!loginDTO.getPassword().equals(user.getPassword())) {
//            if (!passwordEncoder.matches(loginDTO.getPassword(),user.getPassword())){
            return Result.fail("密码错误");
        }
        String token= JwtUtil.generateToken(user.getUsername());
        return Result.success(token);
    }

    @GetMapping("/getInfo")
    public Result<User> getUserInfo(Authentication authentication){
        String username=authentication.getName();
        User user=userService.getByUsername(username);
        user.setPassword(null);
        return Result.success(user);
    }
}
