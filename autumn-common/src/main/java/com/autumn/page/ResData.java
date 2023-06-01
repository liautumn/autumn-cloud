package com.autumn.page;

import com.autumn.result.Result;

public class ResData {

    public static Result setDataTotal(Object data, Long total) {
        ResPage resPage = new ResPage(data, total);
        return Result.success(resPage);
    }

}
