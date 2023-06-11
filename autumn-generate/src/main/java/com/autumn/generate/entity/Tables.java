package com.autumn.generate.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
public class Tables implements Serializable {

    private static final long serialVersionUID = 1L;

    private String tableName;

    private String tableComment;

}
