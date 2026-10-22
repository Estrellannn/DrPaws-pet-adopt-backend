package com.aoba.pet.controller;

import com.aoba.pet.common.Result;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

@RestController
@RequestMapping("/upload")
public class AvatarController {
    private static final String SAVE_PATH = "D:/pet_upload/avatar/";

    @PostMapping("/avatar")
    public Result<String> uploadAvatar(@RequestParam("file")MultipartFile file){
        if (file.isEmpty()){
            return Result.fail("文件不能为空");
        }
        String originalFilename=file.getOriginalFilename();
        String suffix=originalFilename.substring(originalFilename.lastIndexOf("."));
        String newFilename= UUID.randomUUID()+suffix;
        try {
            file.transferTo(new File(SAVE_PATH+newFilename));
            String url="http://localhost:8888/avatar/"+newFilename;
            return Result.success(url);
        }catch (Exception e){
            e.printStackTrace();
            return Result.fail("上传失败");
        }
    }
}
