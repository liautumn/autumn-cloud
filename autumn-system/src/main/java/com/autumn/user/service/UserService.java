package com.autumn.user.service;

import com.autumn.result.Result;
import com.autumn.sa_token.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author Administrator
 * @description 针对表【sys_user(用户信息表)】的数据库操作Service
 * @createDate 2023-05-25 13:48:41
 */
public interface UserService extends IService<User> {

    Result delete(String ids);

    Result select();

    Result updateUser(User user);

    Result getOneUser(String id);
}
