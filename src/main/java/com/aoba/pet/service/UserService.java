package com.aoba.pet.service;

import com.aoba.pet.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.stereotype.Service;

@Service
public interface UserService extends IService<User> {
    User getByUsername(String username);
}
