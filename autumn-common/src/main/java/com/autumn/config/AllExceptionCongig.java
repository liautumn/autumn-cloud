package com.autumn.config;

import cn.dev33.satoken.exception.DisableServiceException;
import cn.dev33.satoken.exception.NotLoginException;
import cn.dev33.satoken.exception.NotPermissionException;
import cn.dev33.satoken.exception.NotRoleException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * 全局异常处理
 */
@ControllerAdvice
public class AllExceptionCongig {

    // 全局异常拦截（拦截项目中的所有异常）
    @ResponseBody
    @ExceptionHandler
    public Map handlerException(Exception e, HttpServletRequest request, HttpServletResponse response){

        Map codeMap = new HashMap();

        // 打印堆栈，以供调试
        System.out.println("全局异常---------------");
        e.printStackTrace();

        // 不同异常返回不同状态码
        if (e instanceof NotLoginException) {    // 如果是未登录异常
            NotLoginException ee = (NotLoginException) e;
            codeMap.put("code", 2001);
            codeMap.put("msg", "未登录 " + ee.getMessage());
            return codeMap;
        } else if (e instanceof NotRoleException) {        // 如果是角色异常
            NotRoleException ee = (NotRoleException) e;
            codeMap.put("code", 2002);
            codeMap.put("msg", "无此角色：" + ee.getRole());
            return codeMap;
        } else if (e instanceof NotPermissionException) {    // 如果是权限异常
            NotPermissionException ee = (NotPermissionException) e;
            codeMap.put("code", 2003);
            codeMap.put("msg", "无此权限：" + ee.getCode());
            return codeMap;
        } else if (e instanceof DisableServiceException) {    // 如果是被封禁异常
            DisableServiceException ee = (DisableServiceException) e;
            codeMap.put("code", 2004);
            codeMap.put("msg", "账号被封禁：" + ee.getDisableTime() + "秒后解封, 封禁等级：" + ee.getLevel());
            return codeMap;
        } else {    // 普通异常, 输出：500 + 异常信息
            codeMap.put("code", 500);
            codeMap.put("msg", "系统异常：" + e.getMessage());
            return codeMap;
        }

    }

}
