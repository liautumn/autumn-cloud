package com.autumn.role.mapper;

import com.autumn.role.entity.Role;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
* @author Administrator
* @description 针对表【sys_role(角色信息表)】的数据库操作Mapper
* @createDate 2023-05-25 14:19:47
* @Entity com.autumn.system.role.entity.Role
*/
public interface RoleMapper extends BaseMapper<Role> {

    List<Role> getRoleKeyList(String loginId);

}




