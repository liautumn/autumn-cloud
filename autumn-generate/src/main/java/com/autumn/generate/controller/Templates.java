package com.autumn.generate.controller;

import com.alibaba.fastjson2.JSON;
import com.autumn.generate.entity.GenPublic;
import com.autumn.utils.GenerateUtil;

import java.util.Map;

/**
 * @author liqiuzhuang
 * @date 2023-06-11 15:31
 */
public class Templates {

    public static Boolean genController(GenPublic genPublic) {
        String templateName = "controller";
        String templatePath = "java";
        String fileOutName = genPublic.getEntityName() + GenerateUtil.captureName(templateName);
        String fileOutsuffix = "java";
        String outPackage = "src/main/java/com/autumn/" + GenerateUtil.lowerFirst(genPublic.getEntityName()) + "/" + templateName;
        Map data = JSON.parseObject(JSON.toJSONString(genPublic), Map.class);
        return GenerateUtil.generateCode(templatePath, templateName, fileOutName, fileOutsuffix, outPackage, data);
    }

    public static Boolean genService(GenPublic genPublic) {
        String templateName = "service";
        String templatePath = "java";
        String fileOutName = genPublic.getEntityName() + GenerateUtil.captureName(templateName);
        String fileOutsuffix = "java";
        String outPackage = "src/main/java/com/autumn/" + GenerateUtil.lowerFirst(genPublic.getEntityName()) + "/" + templateName;
        Map data = JSON.parseObject(JSON.toJSONString(genPublic), Map.class);
        return GenerateUtil.generateCode(templatePath, templateName, fileOutName, fileOutsuffix, outPackage, data);
    }

    public static Boolean genServiceImpl(GenPublic genPublic) {
        String templateName = "serviceImpl";
        String templatePath = "java";
        String fileOutName = genPublic.getEntityName() + GenerateUtil.captureName(templateName);
        String fileOutsuffix = "java";
        String outPackage = "src/main/java/com/autumn/" + GenerateUtil.lowerFirst(genPublic.getEntityName()) + "/service/impl";
        Map data = JSON.parseObject(JSON.toJSONString(genPublic), Map.class);
        return GenerateUtil.generateCode(templatePath, templateName, fileOutName, fileOutsuffix, outPackage, data);
    }

    public static Boolean genMapper(GenPublic genPublic) {
        String templateName = "mapper";
        String templatePath = "java";
        String fileOutName = genPublic.getEntityName() + GenerateUtil.captureName(templateName);
        String fileOutsuffix = "java";
        String outPackage = "src/main/java/com/autumn/" + GenerateUtil.lowerFirst(genPublic.getEntityName()) + "/" + templateName;
        Map data = JSON.parseObject(JSON.toJSONString(genPublic), Map.class);
        return GenerateUtil.generateCode(templatePath, templateName, fileOutName, fileOutsuffix, outPackage, data);
    }

    public static Boolean genMapperXml(GenPublic genPublic) {
        String templateName = "mapperXml";
        String templatePath = "java";
        String fileOutName = genPublic.getEntityName() + "Mapper";
        String fileOutsuffix = "xml";
        String outPackage = "src/main/java/com/autumn/" + GenerateUtil.lowerFirst(genPublic.getEntityName()) + "/mapper";
        Map data = JSON.parseObject(JSON.toJSONString(genPublic), Map.class);
        return GenerateUtil.generateCode(templatePath, templateName, fileOutName, fileOutsuffix, outPackage, data);
    }

    public static Boolean genEntity(GenPublic genPublic) {
        String templateName = "entity";
        String templatePath = "java";
        String fileOutName = genPublic.getEntityName();
        String fileOutsuffix = "java";
        String outPackage = "src/main/java/com/autumn/" + GenerateUtil.lowerFirst(genPublic.getEntityName()) + "/" + templateName;
        Map data = JSON.parseObject(JSON.toJSONString(genPublic), Map.class);
        return GenerateUtil.generateCode(templatePath, templateName, fileOutName, fileOutsuffix, outPackage, data);
    }

    public static Boolean genInsertDto(GenPublic genPublic) {
        String templateName = "insertDto";
        String templatePath = "java";
        String fileOutName = genPublic.getEntityName() + GenerateUtil.captureName(templateName);
        String fileOutsuffix = "java";
        String outPackage = "src/main/java/com/autumn/" + GenerateUtil.lowerFirst(genPublic.getEntityName()) + "/entity";
        Map data = JSON.parseObject(JSON.toJSONString(genPublic), Map.class);
        return GenerateUtil.generateCode(templatePath, templateName, fileOutName, fileOutsuffix, outPackage, data);
    }

    public static Boolean genUpdateDto(GenPublic genPublic) {
        String templateName = "updateDto";
        String templatePath = "java";
        String fileOutName = genPublic.getEntityName() + GenerateUtil.captureName(templateName);
        String fileOutsuffix = "java";
        String outPackage = "src/main/java/com/autumn/" + GenerateUtil.lowerFirst(genPublic.getEntityName()) + "/entity";
        Map data = JSON.parseObject(JSON.toJSONString(genPublic), Map.class);
        return GenerateUtil.generateCode(templatePath, templateName, fileOutName, fileOutsuffix, outPackage, data);
    }

    public static Boolean genSelectDto(GenPublic genPublic) {
        String templateName = "selectDto";
        String templatePath = "java";
        String fileOutName = genPublic.getEntityName() + GenerateUtil.captureName(templateName);
        String fileOutsuffix = "java";
        String outPackage = "src/main/java/com/autumn/" + GenerateUtil.lowerFirst(genPublic.getEntityName()) + "/entity";
        Map data = JSON.parseObject(JSON.toJSONString(genPublic), Map.class);
        return GenerateUtil.generateCode(templatePath, templateName, fileOutName, fileOutsuffix, outPackage, data);
    }

    public static Boolean genList(GenPublic genPublic) {
        String templateName = "list";
        String templatePath = "vue3";
        String fileOutName = GenerateUtil.lowerFirst(genPublic.getEntityName()) + "List";
        String fileOutsuffix = "vue";
        String outPackage = "src/src/views/" + genPublic.getSystemCode() + "/" + GenerateUtil.lowerFirst(genPublic.getEntityName()) + "Manage";
        Map data = JSON.parseObject(JSON.toJSONString(genPublic), Map.class);
        return GenerateUtil.generateCode(templatePath, templateName, fileOutName, fileOutsuffix, outPackage, data);
    }

    public static Boolean genForm(GenPublic genPublic) {
        String templateName = "form";
        String templatePath = "vue3";
        String fileOutName = GenerateUtil.lowerFirst(genPublic.getEntityName()) + "Form";
        String fileOutsuffix = "vue";
        String outPackage = "src/src/views/" + genPublic.getSystemCode() + "/" + GenerateUtil.lowerFirst(genPublic.getEntityName()) + "Manage";
        Map data = JSON.parseObject(JSON.toJSONString(genPublic), Map.class);
        return GenerateUtil.generateCode(templatePath, templateName, fileOutName, fileOutsuffix, outPackage, data);
    }

    public static Boolean genInterface(GenPublic genPublic) {
        String templateName = "interface";
        String templatePath = "vue3";
        String fileOutName = GenerateUtil.lowerFirst(genPublic.getEntityName());
        String fileOutsuffix = "ts";
        String outPackage = "src/src/api/interface/" + genPublic.getSystemCode() + "/" + GenerateUtil.lowerFirst(genPublic.getEntityName());
        Map data = JSON.parseObject(JSON.toJSONString(genPublic), Map.class);
        return GenerateUtil.generateCode(templatePath, templateName, fileOutName, fileOutsuffix, outPackage, data);
    }

    public static Boolean genApi(GenPublic genPublic) {
        String templateName = "api";
        String templatePath = "vue3";
        String fileOutName = GenerateUtil.lowerFirst(genPublic.getEntityName());
        String fileOutsuffix = "ts";
        String outPackage = "src/src/api/modules/" + genPublic.getSystemCode() + "/" + GenerateUtil.lowerFirst(genPublic.getEntityName());
        Map data = JSON.parseObject(JSON.toJSONString(genPublic), Map.class);
        return GenerateUtil.generateCode(templatePath, templateName, fileOutName, fileOutsuffix, outPackage, data);
    }

}
