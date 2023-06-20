package com.autumn.dictData.service.impl;

import com.alibaba.excel.EasyExcel;
import com.autumn.dictData.entity.DictData;
import com.autumn.dictData.entity.DictDataInsertDto;
import com.autumn.dictData.entity.DictDataSelectDto;
import com.autumn.dictData.entity.DictDataUpdateDto;
import com.autumn.dictData.mapper.DictDataMapper;
import com.autumn.dictData.service.DictDataService;
import com.autumn.easyExcel.CustomRowHeightColWidthHandler;
import com.autumn.easyExcel.RowHeightColWidthModel;
import com.autumn.easyExcel.listener.ImportExcelListener;
import com.autumn.page.ResData;
import com.autumn.result.Result;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.ArrayList;
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
    private DictDataMapper dictDataMapper;

    /**
     * 测试生成表查询
     */
    @Override
    public Result selectDictData(DictDataSelectDto dictDataTypeSelectDto) {
        Page<DictData> page = PageHelper.startPage(dictDataTypeSelectDto.getPageNum(), dictDataTypeSelectDto.getPageSize());
        LambdaQueryWrapper<DictData> queryWrapper = new LambdaQueryWrapper<DictData>()
                .eq(DictData::getDictTypeId, dictDataTypeSelectDto.getDictTypeId())
                .orderByAsc(DictData::getDictSort);
        List<DictData> dictDataTypeList = dictDataMapper.selectList(queryWrapper);
        return ResData.setDataTotal(page, dictDataTypeList);
    }

    /**
     * 测试生成表新增
     */
    @Override
    public Result insertDictData(DictDataInsertDto dictDataTypeInsertDto) {
        DictData dictDataType = new DictData();
        BeanUtils.copyProperties(dictDataTypeInsertDto, dictDataType);
        int i = dictDataMapper.insert(dictDataType);
        return i > 0 ? Result.success() : Result.fail();
    }

    /**
     * 测试生成表修改
     */
    @Override
    public Result updateDictData(DictDataUpdateDto dictDataTypeUpdateDto) {
        DictData dictDataType = new DictData();
        BeanUtils.copyProperties(dictDataTypeUpdateDto, dictDataType);
        int i = dictDataMapper.updateById(dictDataType);
        return i > 0 ? Result.success() : Result.fail();
    }

    /**
     * 测试生成表删除
     */
    @Override
    public Result deleteDictData(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        int i = dictDataMapper.deleteBatchIds(idList);
        return i > 0 ? Result.success() : Result.fail();
    }

    @Override
    public void exportDictData(DictDataSelectDto dictDataSelectDto, HttpServletResponse response) {
        List<DictData> dictDatas = new ArrayList<>();
        if (!dictDataSelectDto.getTempFlag()) {
            LambdaQueryWrapper<DictData> queryWrapper = new LambdaQueryWrapper<DictData>()
                    .orderByDesc(DictData::getCreateTime);
            dictDatas = dictDataMapper.selectList(queryWrapper);
        }
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setCharacterEncoding("utf-8");
        try {
            // 这里URLEncoder.encode可以防止中文乱码 当然和easyexcel没有关系
            String fileName = URLEncoder.encode("字典数据列表", "UTF-8").replaceAll("\\+", "%20");
            response.setHeader("Content-disposition", "attachment;filename*=utf-8''" + fileName + ".xlsx");
            List<RowHeightColWidthModel> rowHeightColWidthList = new ArrayList<>();
            String sheetName = "字典数据";
            //设置列宽
            rowHeightColWidthList.add(RowHeightColWidthModel.createColWidthModel(sheetName, 0, 20));
            //隐藏列
            rowHeightColWidthList.add(RowHeightColWidthModel.createHideColModel(sheetName, 0));
            EasyExcel.write(response.getOutputStream(), DictData.class)
                    .sheet(sheetName)
                    .registerWriteHandler(new CustomRowHeightColWidthHandler(rowHeightColWidthList))
                    .doWrite(dictDatas);
        } catch (Exception e) {
            e.getMessage();
        }
    }

    @Resource
    private DictDataService dictDataService;

    @Override
    public Result importDictData(MultipartFile file) {
        try {
            EasyExcel.read(file.getInputStream(), DictData.class, new ImportExcelListener<DictData>(dictDataService)).sheet("字典数据").doRead();
        } catch (Exception e) {
            return Result.failMsg(e.getMessage());
        }
        return Result.success();
    }
}
