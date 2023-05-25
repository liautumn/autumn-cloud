package com.autumn.post.service.impl;

import com.autumn.post.entity.Post;
import com.autumn.post.mapper.PostMapper;
import com.autumn.post.service.PostService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author Administrator
 * @description 针对表【sys_post(岗位信息表)】的数据库操作Service实现
 * @createDate 2023-05-25 14:22:56
 */
@Service
public class PostServiceImpl extends ServiceImpl<PostMapper, Post> implements PostService {

}




