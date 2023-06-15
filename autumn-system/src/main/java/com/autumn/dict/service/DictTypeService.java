package com.autumn.dict.service;

import com.autumn.dict.entity.DictType;
import com.autumn.dict.entity.DictTypeInsertDto;
import com.autumn.dict.entity.DictTypeSelectDto;
import com.autumn.dict.entity.DictTypeUpdateDto;
import com.autumn.result.Result;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author Administrator
* @description 针对表【sys_dict_type(字典类型表)】的数据库操作Service
* @createDate 2023-06-10 14:58:48
*/
public interface DictTypeService extends IService<DictType> {

    Result selectDict(DictTypeSelectDto dictTypeSelectDto);

    Result insertDict(DictTypeInsertDto dictTypeInsertDto);

    Result updateDict(DictTypeUpdateDto dictTypeUpdateDto);

    Result deleteDict(String ids);

    Result parseDict(String dictType);
}
