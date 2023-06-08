package com.autumn.user.service;

import com.autumn.result.Result;
import com.autumn.user.entity.LoginDto;
import com.autumn.user.entity.User;
import com.autumn.user.entity.UserInsertDto;
import com.autumn.user.entity.UserUpdateDto;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author Administrator
 * @description 针对表【sys_user(用户信息表)】的数据库操作Service
 * @createDate 2023-05-25 13:48:41
 */
public interface UserService extends IService<User> {

    Result deleteUser(String id);

    Result insertUser(UserInsertDto userInsertDto);

    Result updateUser(UserUpdateDto userUpdateDto);

    Result login(LoginDto login);
}
