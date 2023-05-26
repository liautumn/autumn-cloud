package com.autumn.menu.controller;

import com.autumn.menu.service.MenuService;
import com.autumn.result.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Map;

@RestController
@RequestMapping("/menu")
public class MenuController {

    @Resource
    private MenuService menuService;

    @PostMapping("/getMenuList")
    public Result getMenuList() {
        return menuService.getMenuList();
    }

}
