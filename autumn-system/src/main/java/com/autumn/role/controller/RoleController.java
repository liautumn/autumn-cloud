package com.autumn.role.controller;

import com.autumn.result.Result;
import com.autumn.role.service.RoleService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/role")
public class RoleController {

    @Resource
    private RoleService roleService;

    @PostMapping("/getRoleList")
    public Result logout() {
        return roleService.getRolelist();
    }

}
