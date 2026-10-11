package com.aoba.pet.controller;

import com.aoba.pet.entity.Adopt;
import com.aoba.pet.service.AdoptService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/adopt")
public class AdoptController {
    @Resource
    private AdoptService adoptService;

    @GetMapping("/list")
    public IPage<Adopt> getAdoptPage(
            @RequestParam(defaultValue = "1") Long pageNum,
            @RequestParam(defaultValue = "8") Long pageSize
    ){
        Page<Adopt> page = new Page<>(pageNum,pageSize);
        IPage<Adopt> pageData = adoptService.page(page);
        return pageData;
    }

}
