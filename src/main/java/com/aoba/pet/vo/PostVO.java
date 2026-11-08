package com.aoba.pet.vo;

import lombok.Data;

import java.util.List;

@Data
public class PostVO {
    private Integer id;
    private String title;
    private String content;
    private Integer userId;
    private Integer categoryId;
    private String address;

    private String username;
    private String avatar;

    private List<String> imgList;
}
