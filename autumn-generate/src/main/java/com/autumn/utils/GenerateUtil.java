package com.autumn.utils;

import freemarker.cache.ClassTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;
import org.springframework.util.StringUtils;

import java.io.*;
import java.util.Map;

/**
 * @Author: liqiuzhuang
 * @Date: 2022/10/17
 */
public class GenerateUtil {

    /**
     * 将字符串的首字母转大写
     *
     * @param str 需要转换的字符串
     * @return
     */
    public static String captureName(String str) {
        // 进行字母的ascii编码前移，效率要高于截取字符串进行转换的操作
        char[] cs = str.toCharArray();
        cs[0] -= 32;
        return String.valueOf(cs);
    }

    /**
     * 将字符串的首字母转小写
     *
     * @param str 需要转换的字符串
     * @return
     */
    public static String lowerFirst(String str) {
        // 同理
        char[] cs = str.toCharArray();
        cs[0] += 32;
        return String.valueOf(cs);
    }

    /**
     * 去掉字符串指定的前缀
     *
     * @param str    字符串名称
     * @param prefix 前缀数组
     * @return
     */
    public static String removePrefix(String str, String[] prefix) {
        if (StringUtils.isEmpty(str)) {
            return "";
        } else {
            if (null != prefix) {
                String[] prefixArray = prefix;

                for (int i = 0; i < prefix.length; ++i) {
                    String pf = prefixArray[i];
                    if (str.toLowerCase().matches("^" + pf.toLowerCase() + ".*")) {
                        return str.substring(pf.length());//截取前缀后面的字符串
                    }
                }
            }

            return str;
        }
    }

    /**
     * 清除字符串下划线
     *
     * @param strKey
     * @return
     */
    public static String getNoUnderlineStr(String strKey) {
        if (strKey.indexOf("_") != -1) {
            String[] keyArray = strKey.split("_");
            StringBuffer sb = new StringBuffer();
            boolean flag = false;
            for (String key : keyArray) {
                if (flag) {
                    //下划线后的首字母大写
                    sb.append(StringUtils.capitalize(key));
                } else {
                    flag = true;
                    sb.append(key);
                }
            }
            strKey = sb.toString();
        }
        return strKey;
    }


    public static Boolean generateCode(String templatePath, String templateName, String fileOutName, String fileOutsuffix, String outPackage, Map data) {
        Writer out = null;
        try {
            final Configuration configuration = new Configuration(Configuration.VERSION_2_3_28);
            final ClassTemplateLoader loader = new ClassTemplateLoader(GenerateUtil.class, "/templates/" + templatePath);
            configuration.setTemplateLoader(loader);
            configuration.setDefaultEncoding("UTF-8");
            configuration.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
            final String fileTemplate = templateName + ".ftl";
            final Template temp = configuration.getTemplate(fileTemplate);

            //创建输出流，定义输出的文件
            File file = new File(outPackage);
            file.delete();
            file.mkdirs();
            file = new File(outPackage + "/" + fileOutName + "." + fileOutsuffix);
            out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file)));
            temp.process(data, out);
            return true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

}
