package com.autumn.user.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * @author lqz
 * @date 2023-07-10 15:27:07
 * 用户信息 UpdateDto
 */
@Data
@Accessors
public class UserUpdateDto implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户ID
     */
    private String id;
    /**
     * 部门ID
     */
    private String deptId;
    /**
     * 所属角色
     */
    private List roleList;
    /**
     * 所属岗位
     */
    private List postList;
    /**
     * 用户账号
     */
    private String userName;
    /**
     * 用户昵称
     */
    private String nickName;
    /**
     * 用户类型（00系统用户）
     */
    private String userType;
    /**
     * 用户邮箱
     */
    private String email;
    /**
     * 手机号码
     */
    private String phonenumber;
    /**
     * 用户性别（0男 1女 2未知）
     */
    private String sex;
    /**
     * 头像地址
     */
    private String avatar;
    /**
     * 密码
     */
    private String password;
    /**
     * 备注
     */
    private String remark;
    /**
     * 帐号状态（0正常 1停用）
     */
    private String status;


}
