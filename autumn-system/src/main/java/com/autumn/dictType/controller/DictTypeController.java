package com.autumn.dictType.controller;

import com.autumn.dictType.entity.DictTypeInsertDto;
import com.autumn.dictType.entity.DictTypeSelectDto;
import com.autumn.dictType.entity.DictTypeUpdateDto;
import com.autumn.dictType.service.DictTypeService;
import com.autumn.result.Result;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
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
     * 字典类型查询
     */
    @Cacheable(value = "dictType")
    @PostMapping("/select")
    public Result selectDictType(@RequestBody DictTypeSelectDto dictTypeSelectDto) {
        return dictTypeService.selectDictType(dictTypeSelectDto);
    }

    /**
     * 字典类型新增
     */
    @CacheEvict(value = "dictType", allEntries = true)
    @PostMapping("/insert")
    public Result insertDictType(@RequestBody @Validated DictTypeInsertDto dictTypeInsertDto) {
        return dictTypeService.insertDictType(dictTypeInsertDto);
    }

    /**
     * 字典类型修改
     */
    @CacheEvict(value = "dictType", allEntries = true)
    @PostMapping("/update")
    public Result updateDictType(@RequestBody @Validated DictTypeUpdateDto dictTypeUpdateDto) {
        return dictTypeService.updateDictType(dictTypeUpdateDto);
    }

    /**
     * 字典类型删除
     */
    @CacheEvict(value = "dictType", allEntries = true)
    @GetMapping("/delete")
    public Result deleteDictType(@RequestParam("ids") @NotBlank(message = "ids不能为空") String ids) {
        return dictTypeService.deleteDictType(ids);
    }

    /**
     * 字典类型解析
     */
    @Cacheable(value = "dictType")
    @GetMapping("/parse")
    public Result parseDictType(@RequestParam("dictType") @NotBlank(message = "dictType不能为空") String dictType) {
        return dictTypeService.parseDictType(dictType);
    }

    /**
     * 字典类型excel导出
     */
    @PostMapping("/export")
    public void exportDictType(@RequestBody DictTypeSelectDto dictTypeSelectDto, HttpServletResponse response) {
        dictTypeService.exportDictType(dictTypeSelectDto, response);
    }

    /**
     * 字典类型excel导入
     */
    @CacheEvict(value = "dictType", allEntries = true)
    @PostMapping("/import")
    public Result importDictType(MultipartFile file) {
        return dictTypeService.importDictType(file);
    }

}
