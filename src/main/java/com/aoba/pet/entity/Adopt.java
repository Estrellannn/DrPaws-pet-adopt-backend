package com.aoba.pet.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("adopt")
public class Adopt {
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String petName;
    private String petType;
    private String petBreed;
    private String petAge;
    private String petGender;
    private String petDesc;
    private String petImg;
    private String health;
}
