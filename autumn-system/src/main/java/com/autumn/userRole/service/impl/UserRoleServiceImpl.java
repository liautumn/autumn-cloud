package com.autumn.userRole.service.impl;

import com.autumn.userRole.entity.UserRole;
import com.autumn.userRole.mapper.UserRoleMapper;
import com.autumn.userRole.service.UserRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author lqz
 * @date 2023-07-10 18:33:05
 * 用户角色关系表 ServiceImpl
 */
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements UserRoleService {

}
