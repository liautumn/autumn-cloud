package com.autumn.user.service.impl;


import com.autumn.result.Result;
import com.autumn.sa_token.entity.User;
import com.autumn.user.mapper.UserMapper;
import com.autumn.user.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author Administrator
 * @description 针对表【sys_user(用户信息表)】的数据库操作Service实现
 * @createDate 2023-05-25 13:48:41
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public Result delete(String ids) {
        List<String> list = new ArrayList(Arrays.asList(ids.split(",")));
        int batchIds = userMapper.deleteBatchIds(list);
        return Result.successData(batchIds);
    }

    @Override
    public Result select() {
        List<User> users = userMapper.selectList(null);
        return Result.successData(users);
    }

    @Override
    public Result updateUser(User user) {
        return userMapper.updateById(user) > 0 ? Result.success() : Result.fail();
    }

}
