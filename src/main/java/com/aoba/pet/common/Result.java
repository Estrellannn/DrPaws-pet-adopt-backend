package com.aoba.pet.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Result<T> {
    private Integer code;
    private String msg;
    private T data;

    public static <T> Result<T> success(T data){
        return new Result<>(200,"成功",data);
    }
    public static <T> Result<T> fail(String msg){
        return new Result<>(500,msg,null);
    }
}
