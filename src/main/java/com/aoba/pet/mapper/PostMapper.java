package com.aoba.pet.mapper;

import com.aoba.pet.entity.Post;
import com.aoba.pet.vo.PostVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PostMapper extends BaseMapper<Post> {
    List<PostVO> selectPostList(@Param("categoryId") Integer categoryId);
}
