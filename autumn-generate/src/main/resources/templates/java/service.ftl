package ${rootPath}.${entityName?uncap_first}.service;

import ${rootPath}.${entityName?uncap_first}.entity.${entityName};
import ${rootPath}.${entityName?uncap_first}.entity.${entityName}InsertDto;
import ${rootPath}.${entityName?uncap_first}.entity.${entityName}SelectDto;
import ${rootPath}.${entityName?uncap_first}.entity.${entityName}UpdateDto;
import ${rootPath}.result.Result;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author ${author}
 * @date ${dateTime}
 * ${title} Service
 */
public interface ${entityName}Service extends IService<${entityName}> {

    /**
     * ${title}查询
     */
    Result select${entityName}(${entityName}SelectDto ${entityName?uncap_first}SelectDto);

    /**
     * ${title}新增
     */
    Result insert${entityName}(${entityName}InsertDto ${entityName?uncap_first}InsertDto);

    /**
     * ${title}修改
     */
    Result update${entityName}(${entityName}UpdateDto ${entityName?uncap_first}UpdateDto);

    /**
     * ${title}删除
     */
    Result delete${entityName}(String ids);

}
