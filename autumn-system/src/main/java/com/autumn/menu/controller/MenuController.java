package com.autumn.menu.controller;

import cn.dev33.satoken.annotation.SaCheckDisable;
import cn.dev33.satoken.annotation.SaIgnore;
import com.autumn.menu.entity.MenuDto;
import com.autumn.menu.service.MenuService;
import com.autumn.result.Result;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/menu")
public class MenuController {

    @Resource
    private MenuService menuService;

    /**
     * 获取个人菜单路由列表
     *
     * @return
     */
    @GetMapping("/list")
    public Result getMenuList() {
        return menuService.getMenuList();
    }

    /**
     * 菜单查询
     */
    @GetMapping("/select")
    @SaIgnore
    public Result selectMenu(MenuDto menuDto) {
        return menuService.selectMenu(menuDto);
    }

    /**
     * 菜单新增
     */
    @PostMapping("/insert")
    public Result insertMenu(MenuDto menuDto) {
        return menuService.insertMenu(menuDto);
    }

    /**
     * 菜单修改
     */
    @PostMapping("/update")
    public Result updateMenu(MenuDto menuDto) {
        return menuService.updateMenu(menuDto);
    }

    /**
     * 菜单删除
     */
    @PostMapping("/delete")
    public Result deleteMenu(String ids) {
        return menuService.deleteMenu(ids);
    }

}
