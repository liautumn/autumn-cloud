package com.autumn.menu.controller;

import com.autumn.menu.entity.MenuInsertDto;
import com.autumn.menu.entity.MenuSelectDto;
import com.autumn.menu.entity.MenuUpdateDto;
import com.autumn.menu.service.MenuService;
import com.autumn.result.Result;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

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
    @PostMapping("/select")
    public Result selectMenu(@RequestBody MenuSelectDto menuSelectDto) {
        return menuService.selectMenu(menuSelectDto);
    }

    /**
     * 菜单新增
     */
    @PostMapping("/insert")
    public Result insertMenu(@RequestBody @Validated MenuInsertDto menuInsertDto) {
        return menuService.insertMenu(menuInsertDto);
    }

    /**
     * 菜单修改
     */
    @PostMapping("/update")
    public Result updateMenu(@RequestBody @Validated MenuUpdateDto menuUpdateDto) {
        return menuService.updateMenu(menuUpdateDto);
    }

    /**
     * 菜单删除
     */
    @GetMapping("/delete")
    public Result deleteMenu(@RequestParam("ids") String ids) {
        return menuService.deleteMenu(ids);
    }

    /**
     * 菜单excel导出
     */
    @PostMapping("/export")
    public void exportMenu(@RequestBody MenuSelectDto menuSelectDto, HttpServletResponse response) {
        menuService.exportMenu(menuSelectDto, response);
    }

    /**
     * 菜单excel导入
     */
    @PostMapping("/import")
    public Result importMenu(MultipartFile file) {
        return menuService.importMenu(file);
    }

}
