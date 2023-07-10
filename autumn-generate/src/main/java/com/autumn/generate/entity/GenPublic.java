package com.autumn.generate.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @author liqiuzhuang
 * @date 2023-06-11 18:51
 */
@Data
@Accessors
public class GenPublic {

    private String entityName;

    private String rootPath;

    private List<Columns> columns;

    private String title;

    private String dateTime;

    private String author;

    private String tableName;

    private String tableComment;

    private String systemCode;

}
