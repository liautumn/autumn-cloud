package com.autumn.user.entity;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

@Data
public class PasswordDto implements Serializable {

    /**
     * ID
     */
    @NotBlank(message = "用户ID不能为空")
    private String id;

    /**
     * 旧密码
     */
    @NotBlank(message = "旧密码不能为空")
    private String oldPassword;

    /**
     * 新密码
     */
    @NotBlank(message = "新密码不能为空")
    private String newPassword;

    private static final long serialVersionUID = 1L;
}
