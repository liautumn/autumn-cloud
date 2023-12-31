package com.autumn.user.mapper;

import com.autumn.saToken.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.Map;

/**
 * @author Administrator
 * @description 针对表【sys_user(用户信息表)】的数据库操作Mapper
 * @createDate 2023-05-25 13:48:41
 * @Entity com.autumn.user.entity.User
 */
public interface UserMapper extends BaseMapper<User> {

    Map getInfoById(String id);
}




