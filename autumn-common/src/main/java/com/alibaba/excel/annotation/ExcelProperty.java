//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.alibaba.excel.annotation;

import com.alibaba.excel.converters.AutoConverter;
import com.alibaba.excel.converters.Converter;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface ExcelProperty {
    String[] value() default {""};

    int index() default -1;

    int order() default Integer.MAX_VALUE;

    Class<? extends Converter<?>> converter() default AutoConverter.class;

    String dictCode() default "";

    /** @deprecated */
    @Deprecated
    String format() default "";
}
