package com.aoba.pet.dto;

import lombok.Data;

@Data
public class LoginDTO {
    private String username;
    private String password;
    private String nickname;
    private String phone;
    private Integer gender;
    private String idCard;
    private String address;
    private String avatar;
    private String bgImg;
    private Long id;
}
