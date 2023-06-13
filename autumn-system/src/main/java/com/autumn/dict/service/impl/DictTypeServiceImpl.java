package com.autumn.dict.service.impl;

import com.autumn.dict.entity.DictType;
import com.autumn.dict.entity.DictTypeInsertDto;
import com.autumn.dict.entity.DictTypeSelectDto;
import com.autumn.dict.entity.DictTypeUpdateDto;
import com.autumn.dict.mapper.DictTypeMapper;
import com.autumn.dict.service.DictTypeService;
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
 * @author Administrator
 * @description 针对表【sys_dict_type(字典类型表)】的数据库操作Service实现
 * @createDate 2023-06-10 14:58:48
 */
@Service
public class DictTypeServiceImpl extends ServiceImpl<DictTypeMapper, DictType> implements DictTypeService {

    @Resource
    private DictTypeMapper dictTypeMapper;

    @Override
    public Result selectDict(DictTypeSelectDto dictTypeSelectDto) {
        Page<DictType> page = PageHelper.startPage(dictTypeSelectDto.getPageNum(), dictTypeSelectDto.getPageSize());
        LambdaQueryWrapper<DictType> queryWrapper = new LambdaQueryWrapper<DictType>()
                .orderByDesc(DictType::getCreateTime);
        List<DictType> dictTypeList = dictTypeMapper.selectList(queryWrapper);
        return ResData.setDataTotal(page, dictTypeList);
    }

    @Override
    public Result insertDict(DictTypeInsertDto dictTypeInsertDto) {
        DictType dictType = new DictType();
        BeanUtils.copyProperties(dictTypeInsertDto, dictType);
        int i = dictTypeMapper.insert(dictType);
        return i > 0 ? Result.success() : Result.fail();
    }

    @Override
    public Result updateDict(DictTypeUpdateDto dictTypeUpdateDto) {
        DictType dictType = new DictType();
        BeanUtils.copyProperties(dictTypeUpdateDto, dictType);
        int i = dictTypeMapper.updateById(dictType);
        return i > 0 ? Result.success() : Result.fail();
    }

    @Override
    public Result deleteDict(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        int i = dictTypeMapper.deleteBatchIds(idList);
        return i > 0 ? Result.success() : Result.fail();
    }
}



