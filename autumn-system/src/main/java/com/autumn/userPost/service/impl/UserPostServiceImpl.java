package com.autumn.userPost.service.impl;

import com.autumn.userPost.service.UserPostService;
import com.autumn.userPost.entity.UserPost;
import com.autumn.userPost.mapper.UserPostMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author Administrator
 * @description 针对表【sys_user_post(用户与岗位关联表)】的数据库操作Service实现
 * @createDate 2023-05-25 14:23:49
 */
@Service
public class UserPostServiceImpl extends ServiceImpl<UserPostMapper, UserPost> implements UserPostService {

}




