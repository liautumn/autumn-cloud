package com.autumn.userPost.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * 用户与岗位关联表
 *
 * @TableName sys_user_post
 */
@TableName(value = "sys_user_post")
@Data
public class UserPost implements Serializable {
    /**
     * 用户ID
     */
    @TableField(value = "user_id")
    private Long userId;

    /**
     * 岗位ID
     */
    @TableField(value = "post_id")
    private Long postId;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}
