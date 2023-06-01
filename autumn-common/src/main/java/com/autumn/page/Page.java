package com.autumn.page;

import lombok.Data;

@Data
public class Page {
    /**
     * 页码
     */
    private Integer pageNum = 0;

    /**
     * 条数
     */
    private Integer pageSize = 10;

}
