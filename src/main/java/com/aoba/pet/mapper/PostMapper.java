package com.aoba.pet.mapper;

import com.aoba.pet.entity.Post;
import com.aoba.pet.vo.PostVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PostMapper extends BaseMapper<Post> {
    List<PostVO> selectPostList(@Param("categoryId") Integer categoryId);

    IPage<PostVO> selectPostPage(Page<PostVO> page,@Param("categoryId") Integer categoryId);
}
