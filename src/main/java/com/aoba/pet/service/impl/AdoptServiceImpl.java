package com.aoba.pet.service.impl;

import com.aoba.pet.entity.Adopt;
import com.aoba.pet.mapper.AdoptMapper;
import com.aoba.pet.service.AdoptService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class AdoptServiceImpl extends ServiceImpl<AdoptMapper, Adopt> implements AdoptService {
}
