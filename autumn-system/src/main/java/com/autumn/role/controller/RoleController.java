package com.autumn.role.controller;

import com.autumn.result.Result;
import com.autumn.role.entity.RoleInsertDto;
import com.autumn.role.entity.RoleSelectDto;
import com.autumn.role.entity.RoleUpdateDto;
import com.autumn.role.service.RoleService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * @author lqz
 * @date 2023-07-09 19:34:33
 * 角色信息 Controller
 */
@RestController
@RequestMapping("/role")
public class RoleController {

    @Resource
    private RoleService roleService;

    /**
     * 角色信息查询
     */
    @PostMapping("/select")
    public Result selectRole(@RequestBody RoleSelectDto roleSelectDto) {
        return roleService.selectRole(roleSelectDto);
    }

    /**
     * 获取角色权限下拉数据
     */
    @PostMapping("/getRoleList")
    public Result getRoleList(@RequestBody RoleSelectDto roleSelectDto) {
        return roleService.getRoleList(roleSelectDto);
    }

    /**
     * 角色信息新增
     */
    @PostMapping("/insert")
    public Result insertRole(@RequestBody @Validated RoleInsertDto roleInsertDto) {
        return roleService.insertRole(roleInsertDto);
    }

    /**
     * 角色信息修改
     */
    @PostMapping("/update")
    public Result updateRole(@RequestBody @Validated RoleUpdateDto roleUpdateDto) {
        return roleService.updateRole(roleUpdateDto);
    }

    /**
     * 角色信息删除
     */
    @GetMapping("/delete")
    public Result deleteRole(@RequestParam("ids") String ids) {
        return roleService.deleteRole(ids);
    }

    /**
     * 角色信息excel导出
     */
    @PostMapping("/export")
    public void exportRole(@RequestBody RoleSelectDto roleSelectDto, HttpServletResponse response) {
        roleService.exportRole(roleSelectDto, response);
    }

    /**
     * 角色信息excel导入
     */
    @PostMapping("/import")
    public Result importRole(MultipartFile file) {
        return roleService.importRole(file);
    }

}
