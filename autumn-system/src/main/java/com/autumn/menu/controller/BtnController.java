package com.autumn.menu.controller;

import com.autumn.menu.service.MenuService;
import com.autumn.result.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/buttons")
public class BtnController {

    @Resource
    private MenuService menuService;

    @GetMapping
    public Result getBtnsList() {
        return menuService.getBtnsList();
    }

}
