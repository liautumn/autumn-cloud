package com.autumn.dictType.service;

import com.autumn.dictType.entity.DictTypeInsertDto;
import com.autumn.dictType.entity.DictTypeSelectDto;
import com.autumn.dictType.entity.DictTypeUpdateDto;
import com.autumn.easyExcel.entity.DictType;
import com.autumn.result.Result;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

/**
 * @author Administrator
 * @description 针对表【sys_dict_type(字典类型表)】的数据库操作Service
 * @createDate 2023-06-10 14:58:48
 */
public interface DictTypeService extends IService<DictType> {

    Result selectDictType(DictTypeSelectDto dictTypeSelectDto);

    Result insertDictType(DictTypeInsertDto dictTypeInsertDto);

    Result updateDictType(DictTypeUpdateDto dictTypeUpdateDto);

    Result deleteDictType(String ids);

    Result parseDictType(String dictType);

    void exportDictType(DictTypeSelectDto dictTypeSelectDto, HttpServletResponse response);

    Result importDictType(MultipartFile file);
}
