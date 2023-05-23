package com.autumn.utils;

public enum ErrorCode {
    /*
    * 异常参数
    * */
    SUCCESS(1,"操作成功"),
    ERROR(0,"操作失败"),
    LOGIN_ERROR(201,"账号或密码错误"),
    SYSTEM_ERROR(500,"系统异常"),
    RUN_ERROR(501,"运行时异常"),
    ;


    private int code;
    private String msg;

    ErrorCode(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
