package com.autumn.dictData.controller;

import com.autumn.dictData.entity.DictDataInsertDto;
import com.autumn.dictData.entity.DictDataSelectDto;
import com.autumn.dictData.entity.DictDataUpdateDto;
import com.autumn.dictData.service.DictDataService;
import com.autumn.result.Result;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * @author autumn
 * @date 2023-06-13 09:00:38
 * 测试生成表 Controller
 */
@RestController
@RequestMapping("/dictData")
public class DictDataController {

    @Resource
    private DictDataService dictDataService;

    /**
     * 测试生成表查询
     */
    @PostMapping("/select")
    public Result selectDictData(@RequestBody DictDataSelectDto dictDataSelectDto) {
        return dictDataService.selectDictData(dictDataSelectDto);
    }

    /**
     * 测试生成表新增
     */
    @PostMapping("/insert")
    public Result insertDictData(@RequestBody @Validated DictDataInsertDto dictDataInsertDto) {
        return dictDataService.insertDictData(dictDataInsertDto);
    }

    /**
     * 测试生成表修改
     */
    @PostMapping("/update")
    public Result updateDictData(@RequestBody @Validated DictDataUpdateDto dictDataUpdateDto) {
        return dictDataService.updateDictData(dictDataUpdateDto);
    }

    /**
     * 测试生成表删除
     */
    @GetMapping("/delete")
    public Result deleteDictData(@RequestParam("ids") String ids) {
        return dictDataService.deleteDictData(ids);
    }

    /**
     * 菜单excel导出
     */
    @PostMapping("/export")
    public void exportDictData(@RequestBody DictDataSelectDto dictDataSelectDto, HttpServletResponse response) {
        dictDataService.exportDictData(dictDataSelectDto, response);
    }

    /**
     * 菜单excel导入
     */
    @PostMapping("/import")
    public Result importDictData(MultipartFile file) {
        return dictDataService.importDictData(file);
    }

}
