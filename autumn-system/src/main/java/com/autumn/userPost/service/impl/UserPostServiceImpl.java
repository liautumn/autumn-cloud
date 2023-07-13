package com.autumn.userPost.service.impl;

import com.autumn.userPost.entity.UserPost;
import com.autumn.userPost.mapper.UserPostMapper;
import com.autumn.userPost.service.UserPostService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author lqz
 * @date 2023-07-13 17:25:12
 * 用户岗位关系表 ServiceImpl
 */
@Service
public class UserPostServiceImpl extends ServiceImpl<UserPostMapper, UserPost> implements UserPostService {

}
