package com.autumn.result;

import lombok.Data;

@Data
public class Result {

    private int code;
    private String msg;
    private Object data;

    public Result(int code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public static Result success() {
        return new Result(StatusCode.SUCCESS.getCode(), StatusCode.SUCCESS.getMsg(), null);
    }

    public static Result success(String msg) {
        return new Result(StatusCode.SUCCESS.getCode(), msg, null);
    }

    public static Result success(Object data) {
        return new Result(StatusCode.SUCCESS.getCode(), StatusCode.SUCCESS.getMsg(), data);
    }

    public static Result success(String msg, Object data) {
        return new Result(StatusCode.SUCCESS.getCode(), msg, data);
    }

    public static Result fail() {
        return new Result(StatusCode.ERROR.getCode(), StatusCode.ERROR.getMsg(), null);
    }

    public static Result fail(int code) {
        return new Result(code, StatusCode.ERROR.getMsg(), null);
    }

    public static Result fail(String msg) {
        return new Result(StatusCode.ERROR.getCode(), msg, null);
    }

    public static Result fail(Object data) {
        return new Result(StatusCode.ERROR.getCode(), StatusCode.ERROR.getMsg(), data);
    }

    public static Result fail(int code, String msg) {
        return new Result(code, msg, null);
    }

    public static Result fail(int code, Object data) {
        return new Result(code, StatusCode.ERROR.getMsg(), data);
    }

    public static Result fail(String msg, Object data) {
        return new Result(StatusCode.ERROR.getCode(), msg, data);
    }

    public static Result fail(int code, String msg, Object data) {
        return new Result(code, msg, data);
    }

}
