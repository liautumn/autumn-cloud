package com.autumn.utils;


public class Result {
    private int code;

    private String msg;

    private Object data;

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

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public Result() {
    }

    public Result(int code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public static Result success(){
        return new Result(ErrorCode.SUCCESS.getCode(), ErrorCode.SUCCESS.getMsg(), null);
    }
    public static Result success(Object data){
        return new Result(ErrorCode.SUCCESS.getCode(), ErrorCode.SUCCESS.getMsg(), data);
    }

    public static Result success(Object data, String msg){
        return new Result(ErrorCode.SUCCESS.getCode(), msg, data);
    }

    public static Result fail(int code,String msg){
        return new Result(code,msg,null);
    }

    public static Result fail(){
        return new Result(ErrorCode.SYSTEM_ERROR.getCode(), ErrorCode.SYSTEM_ERROR.getMsg(), null);
    }

    public static Result fail(int code, String msg, Object data){
        return new Result(code,msg,data);
    }

}
