package com.autumn.menu.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/auth")
public class BtnsController {

    @GetMapping("/buttons")
    public Map menu(){
        return JSON.parseObject("{\n" +
                "    \"code\": 200,\n" +
                "    \"msg\": \"成功\",\n" +
                "    \"data\": {\n" +
                "        \"useProTable\": [\n" +
                "            \"add\",\n" +
                "            \"batchAdd\",\n" +
                "            \"export\",\n" +
                "            \"batchDelete\",\n" +
                "            \"status\"\n" +
                "        ],\n" +
                "        \"authButton\": [\n" +
                "            \"add\",\n" +
                "            \"edit\",\n" +
                "            \"delete\",\n" +
                "            \"import\",\n" +
                "            \"export\"\n" +
                "        ]\n" +
                "    }\n" +
                "}", Map.class);
    }

}
