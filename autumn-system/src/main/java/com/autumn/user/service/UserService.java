package com.autumn.user.service;

import com.autumn.result.Result;
import com.autumn.sa_token.entity.User;
import com.autumn.user.entity.UserInsertDto;
import com.autumn.user.entity.UserSelectDto;
import com.autumn.user.entity.UserUpdateDto;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

/**
 * @author lqz
 * @date 2023-07-10 15:27:07
 * 用户信息 Service
 */
public interface UserService extends IService<User> {

    /**
     * 用户信息查询
     */
    Result selectUser(UserSelectDto userSelectDto);

    /**
     * 用户信息新增
     */
    Result insertUser(UserInsertDto userInsertDto);

    /**
     * 用户信息修改
     */
    Result updateUser(UserUpdateDto userUpdateDto);

    /**
     * 用户信息删除
     */
    Result deleteUser(String ids);

    /**
     * 用户信息excel导出
     */
    void exportUser(UserSelectDto userSelectDto, HttpServletResponse response);

    /**
     * 用户信息excel导入
     */
    Result importUser(MultipartFile file);

}
