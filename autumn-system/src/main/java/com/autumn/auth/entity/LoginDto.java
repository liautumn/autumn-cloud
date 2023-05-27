package com.autumn.auth.entity;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

@Data
public class LoginDto implements Serializable {

    /**
     * 用户账号
     */
    @NotBlank(message = "账号不能为空")
    private String userName;

    /**
     * 密码
     */
    @NotBlank(message = "密码不能为空")
    private String password;

    private static final long serialVersionUID = 1L;
}
