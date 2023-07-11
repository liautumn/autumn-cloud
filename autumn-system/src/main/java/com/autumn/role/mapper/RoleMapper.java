package com.autumn.role.mapper;

import com.autumn.role.entity.Role;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * @author lqz
 * @date 2023-07-09 19:34:33
 * 角色信息 Mapper
 */
public interface RoleMapper extends BaseMapper<Role> {

    List<Role> getRoleKeysByLoginId(String loginId);

}
