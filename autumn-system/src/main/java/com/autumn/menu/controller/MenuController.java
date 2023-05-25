package com.autumn.menu.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/menu")
public class MenuController {

    @GetMapping("/list")
    public Map getMenuList() {

        return null;
    }

}
