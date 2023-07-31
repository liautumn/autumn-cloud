package com.autumn.websocket.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import com.autumn.result.Result;
import com.autumn.websocket.webSocket.WebSocket;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
public class WebSocketController {

    @SaIgnore
    @CrossOrigin
    @RequestMapping("/websocket/{userId}")
    public Result webSocket(@PathVariable String userId) {
        return Result.success();
    }

    @Resource
    private WebSocket webSocket;

    @SaIgnore
    @RequestMapping("/send")
    public Result testSend(String msg) {
        webSocket.sendMessageTo(msg, "1678364156664236708");
        return Result.success();
    }
}
