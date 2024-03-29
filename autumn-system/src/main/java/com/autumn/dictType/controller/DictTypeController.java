package com.autumn.dictType.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.autumn.dictType.entity.DictTypeInsertDto;
import com.autumn.dictType.entity.DictTypeSelectDto;
import com.autumn.dictType.entity.DictTypeUpdateDto;
import com.autumn.dictType.service.DictTypeService;
import com.autumn.result.Result;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotBlank;

/**
 * 字典类型管理
 */
@Validated
@RestController
@RequestMapping("/dictType")
public class DictTypeController {

    @Resource
    private DictTypeService dictTypeService;

    /**
     * 字典类型解析
     */
    @Cacheable(value = "dictType")
    @GetMapping("/parse")
    public Result parseDictType(@RequestParam("dictType") @NotBlank(message = "dictType不能为空") String dictType) {
        return dictTypeService.parseDictType(dictType);
    }

    /**
     * 字典类型解析
     */
    @Cacheable(value = "dictTypeOne")
    @GetMapping("/parseOne")
    public Result parseOneDictType(@RequestParam("dictType") @NotBlank(message = "dictType不能为空") String dictType) {
        return dictTypeService.parseOneDictType(dictType);
    }

    /**
     * 字典类型查询
     */
    @PostMapping("/select")
    @SaCheckPermission("dictType.select")
    public Result selectDictType(@RequestBody DictTypeSelectDto dictTypeSelectDto) {
        return dictTypeService.selectDictType(dictTypeSelectDto);
    }

    /**
     * 字典类型新增
     */
    @PostMapping("/insert")
    @SaCheckPermission("dictType.insert")
    public Result insertDictType(@RequestBody @Validated DictTypeInsertDto dictTypeInsertDto) {
        return dictTypeService.insertDictType(dictTypeInsertDto);
    }

    /**
     * 字典类型修改
     */
    @PostMapping("/update")
    @SaCheckPermission("dictType.update")
    public Result updateDictType(@RequestBody @Validated DictTypeUpdateDto dictTypeUpdateDto) {
        return dictTypeService.updateDictType(dictTypeUpdateDto);
    }

    /**
     * 字典类型删除
     */
    @GetMapping("/delete")
    @SaCheckPermission("dictType.delete")
    public Result deleteDictType(@RequestParam("ids") @NotBlank(message = "ids不能为空") String ids) {
        return dictTypeService.deleteDictType(ids);
    }

    /**
     * 字典类型excel导出
     */
    @PostMapping("/export")
    @SaCheckPermission("dictType.export")
    public void exportDictType(@RequestBody DictTypeSelectDto dictTypeSelectDto, HttpServletResponse response) {
        dictTypeService.exportDictType(dictTypeSelectDto, response);
    }

    /**
     * 字典类型excel导入
     */
    @PostMapping("/import")
    @SaCheckPermission("dictType.import")
    public Result importDictType(MultipartFile file) {
        return dictTypeService.importDictType(file);
    }

}
