package com.autumn.easyExcel.converter;

import com.alibaba.excel.converters.Converter;
import com.alibaba.excel.converters.ReadConverterContext;
import com.alibaba.excel.converters.WriteConverterContext;
import com.alibaba.excel.enums.CellDataTypeEnum;
import com.alibaba.excel.metadata.data.WriteCellData;

public class WhetherDictConverter implements Converter<String> {
    @Override
    public Class<?> supportJavaTypeKey() {
        return String.class;
    }

    @Override
    public CellDataTypeEnum supportExcelTypeKey() {
        return CellDataTypeEnum.STRING;
    }

    /**
     * 这里读的时候会调用
     *
     * @param context
     * @return
     */
    @Override
    public String convertToJavaData(ReadConverterContext<?> context) {
        String value = context.getReadCellData().getStringValue();
        if (value.equals("是")) {
            return "0";
        } else {
            return "1";
        }
    }

    /**
     * 这里是写的时候会调用
     *
     * @return
     */
    @Override
    public WriteCellData<?> convertToExcelData(WriteConverterContext<String> context) {
        String value = context.getValue();
        String v = null;
        if (value.equals("0")) {
            v = "是";
        } else {
            v = "否";
        }
        return new WriteCellData<>(v);
    }

}
