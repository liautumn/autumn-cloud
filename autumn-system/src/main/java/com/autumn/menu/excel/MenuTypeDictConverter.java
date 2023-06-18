package com.autumn.menu.excel;

import com.alibaba.excel.converters.Converter;
import com.alibaba.excel.converters.ReadConverterContext;
import com.alibaba.excel.converters.WriteConverterContext;
import com.alibaba.excel.enums.CellDataTypeEnum;
import com.alibaba.excel.metadata.data.WriteCellData;

public class MenuTypeDictConverter implements Converter<String> {
    @Override
    public Class<?> supportJavaTypeKey() {
        return String.class;
    }

    @Override
    public CellDataTypeEnum supportExcelTypeKey() {
        return CellDataTypeEnum.STRING;
    }

    /**
     * 这里读的时候会调用 0目录 1菜单 2按钮
     *
     * @param context
     * @return
     */
    @Override
    public String convertToJavaData(ReadConverterContext<?> context) {
        String value = context.getReadCellData().getStringValue();
        String v = null;
        if (value.equals("目录")) {
            v = "0";
        } else if (value.equals("菜单")) {
            v = "1";
        } else {
            v = "2";
        }
        return v;
    }

    /**
     * 这里是写的时候会调用 0目录 1菜单 2按钮
     *
     * @return
     */
    @Override
    public WriteCellData<?> convertToExcelData(WriteConverterContext<String> context) {
        String value = context.getValue();
        String v = null;
        if (value.equals("0")) {
            v = "目录";
        } else if (value.equals("1")) {
            v = "菜单";
        } else {
            v = "按钮";
        }
        return new WriteCellData<>(v);
    }

}
