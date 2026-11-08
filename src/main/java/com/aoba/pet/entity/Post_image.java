package com.aoba.pet.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("post_image")
public class Post_image {
    @TableId(type = IdType.AUTO)
    private Integer id;
    private Integer postId;
    private String imageUrl;

}
