package com.autumn.menu.excel;

import com.alibaba.excel.converters.Converter;
import com.alibaba.excel.converters.ReadConverterContext;
import com.alibaba.excel.converters.WriteConverterContext;
import com.alibaba.excel.enums.CellDataTypeEnum;
import com.alibaba.excel.metadata.data.WriteCellData;
import com.autumn.dictData.entity.DictData;
import com.autumn.dictData.mapper.DictDataMapper;
import com.autumn.dictType.entity.DictType;
import com.autumn.dictType.mapper.DictTypeMapper;
import com.autumn.springConfig.StaticMethodGetBean;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.util.CollectionUtils;

import java.util.List;

public class MenuTypeDictConverter implements Converter<String> {

    private final String dictType = "menuType";

    private WriteConverterContext<String> context;

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
        DictTypeMapper dictTypeMapper = StaticMethodGetBean.getBean(DictTypeMapper.class);
        DictDataMapper dictDataMapper = StaticMethodGetBean.getBean(DictDataMapper.class);
        LambdaQueryWrapper<DictType> dictTypeLambdaQueryWrapper = new LambdaQueryWrapper<DictType>()
                .eq(DictType::getDictType, dictType);
        DictType dt = dictTypeMapper.selectOne(dictTypeLambdaQueryWrapper);
        if (dt == null) {
            return null;
        }
        LambdaQueryWrapper<DictData> dictDataLambdaQueryWrapper = new LambdaQueryWrapper<DictData>()
                .eq(DictData::getDictType, dt.getDictType());
        List<DictData> dataList = dictDataMapper.selectList(dictDataLambdaQueryWrapper);
        String value = context.getReadCellData().getStringValue();
        String res = null;
        if (!CollectionUtils.isEmpty(dataList)) {
            for (DictData data : dataList) {
                if (value.equals(data.getDictLabel())) {
                    res = data.getDictValue();
                    break;
                }
            }
        }
        return res;
    }

    /**
     * 这里是写的时候会调用
     *
     * @return
     */
    @Override
    public WriteCellData<?> convertToExcelData(WriteConverterContext<String> context) throws InstantiationException, IllegalAccessException {
        String value = context.getValue();
        DictTypeMapper dictTypeMapper = StaticMethodGetBean.getBean(DictTypeMapper.class);
        DictDataMapper dictDataMapper = StaticMethodGetBean.getBean(DictDataMapper.class);
        LambdaQueryWrapper<DictType> dictTypeLambdaQueryWrapper = new LambdaQueryWrapper<DictType>()
                .eq(DictType::getDictType, dictType);
        DictType dt = dictTypeMapper.selectOne(dictTypeLambdaQueryWrapper);
        if (dt == null) {
            return null;
        }
        LambdaQueryWrapper<DictData> dictDataLambdaQueryWrapper = new LambdaQueryWrapper<DictData>()
                .eq(DictData::getDictType, dt.getDictType());
        List<DictData> dataList = dictDataMapper.selectList(dictDataLambdaQueryWrapper);
        String res = null;
        if (!CollectionUtils.isEmpty(dataList)) {
            for (DictData data : dataList) {
                if (value.equals(data.getDictValue())) {
                    res = data.getDictLabel();
                    break;
                }
            }
        }
        return new WriteCellData<>(res);
    }

}
