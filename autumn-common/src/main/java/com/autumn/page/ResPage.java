package com.autumn.page;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResPage {

    /**
     * 数据
     */
    private Object list;

    /**
     * 总数
     */
    private Long total = 0L;

}
