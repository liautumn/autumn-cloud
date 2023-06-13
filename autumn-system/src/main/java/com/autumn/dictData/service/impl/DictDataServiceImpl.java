package com.autumn.dictData.service.impl;

import com.autumn.dict.entity.DictType;
import com.autumn.dictData.entity.DictData;
import com.autumn.dictData.entity.DictDataInsertDto;
import com.autumn.dictData.entity.DictDataSelectDto;
import com.autumn.dictData.entity.DictDataUpdateDto;
import com.autumn.dictData.mapper.DictDataMapper;
import com.autumn.dictData.service.DictDataService;
import com.autumn.page.ResData;
import com.autumn.result.Result;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

/**
 * @author autumn
 * @date 2023-06-13 09:00:38
 * 测试生成表 ServiceImpl
 */
@Service
public class DictDataServiceImpl extends ServiceImpl<DictDataMapper, DictData> implements DictDataService {

    @Resource
    private DictDataMapper dictDataTypeMapper;

    /**
     * 测试生成表查询
     */
    @Override
    public Result selectDictData(DictDataSelectDto dictDataTypeSelectDto) {
        Page<DictData> page = PageHelper.startPage(dictDataTypeSelectDto.getPageNum(), dictDataTypeSelectDto.getPageSize());
        LambdaQueryWrapper<DictData> queryWrapper = new LambdaQueryWrapper<DictData>()
                .eq(DictData::getDictTypeId, dictDataTypeSelectDto.getDictTypeId())
                .orderByAsc(DictData::getDictSort);
        List<DictData> dictDataTypeList = dictDataTypeMapper.selectList(queryWrapper);
        return ResData.setDataTotal(page, dictDataTypeList);
    }

    /**
     * 测试生成表新增
     */
    @Override
    public Result insertDictData(DictDataInsertDto dictDataTypeInsertDto) {
        DictData dictDataType = new DictData();
        BeanUtils.copyProperties(dictDataTypeInsertDto, dictDataType);
        int i = dictDataTypeMapper.insert(dictDataType);
        return i > 0 ? Result.success() : Result.fail();
    }

    /**
     * 测试生成表修改
     */
    @Override
    public Result updateDictData(DictDataUpdateDto dictDataTypeUpdateDto) {
        DictData dictDataType = new DictData();
        BeanUtils.copyProperties(dictDataTypeUpdateDto, dictDataType);
        int i = dictDataTypeMapper.updateById(dictDataType);
        return i > 0 ? Result.success() : Result.fail();
    }

    /**
     * 测试生成表删除
     */
    @Override
    public Result deleteDictData(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        int i = dictDataTypeMapper.deleteBatchIds(idList);
        return i > 0 ? Result.success() : Result.fail();
    }
}
