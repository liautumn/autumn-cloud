package com.autumn.user.entity;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

@Data
public class UserInsertDto implements Serializable {

    /**
     * 用户账号
     */
    @NotBlank(message = "用户ID不能为空")
    private String userName;

    /**
     * 用户密码
     */
    @NotBlank(message = "用户密码不能为空")
    private String password;

    /**
     * 用户昵称
     */
    @NotBlank(message = "用户ID不能为空")
    private String nickName;


    private static final long serialVersionUID = 1L;
}
