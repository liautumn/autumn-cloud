package com.autumn.role.service.impl;

import com.autumn.role.mapper.RoleMapper;
import com.autumn.role.service.RoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.autumn.role.entity.Role;
import org.springframework.stereotype.Service;

/**
* @author Administrator
* @description 针对表【sys_role(角色信息表)】的数据库操作Service实现
* @createDate 2023-05-25 14:19:47
*/
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role>
    implements RoleService {

}




