package com.autumn.test.service.impl;

import com.autumn.test.entity.Demo;
import com.autumn.test.mapper.DemoMapper;
import com.autumn.test.service.DemoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class DemoServiceImpl extends ServiceImpl<DemoMapper, Demo> implements DemoService {

}
