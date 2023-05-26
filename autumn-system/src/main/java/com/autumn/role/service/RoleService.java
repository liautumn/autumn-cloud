package com.autumn.role.service;

import com.autumn.result.Result;
import com.autumn.role.entity.Role;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author Administrator
* @description 针对表【sys_role(角色信息表)】的数据库操作Service
* @createDate 2023-05-25 14:19:47
*/
public interface RoleService extends IService<Role> {

    Result getRolelist();

}
