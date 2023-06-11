package com.autumn.generate.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class Columns implements Serializable {

    private static final long serialVersionUID = 1L;

    private String columnName;

    private String dataType;

    private String jdbcType;

    private String columnComment;

}
