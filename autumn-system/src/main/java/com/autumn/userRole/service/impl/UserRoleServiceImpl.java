package com.autumn.userRole.service.impl;

import com.autumn.userRole.entity.UserRole;
import com.autumn.userRole.mapper.UserRoleMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.autumn.userRole.service.UserRoleService;
import org.springframework.stereotype.Service;

/**
* @author Administrator
* @description 针对表【sys_user_role(用户和角色关联表)】的数据库操作Service实现
* @createDate 2023-05-25 14:21:40
*/
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole>
    implements UserRoleService{

}




