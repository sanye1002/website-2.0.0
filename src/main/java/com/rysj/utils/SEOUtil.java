package com.rysj.utils;

/**
 * @Author zhaoxiang
 * @Date 2018/09/06
 * @Desc
 */
public class SEOUtil {
    public static String getDescription(String content){
        String newContent = HTMLSpirit.delHTMLTag(content);
        System.out.println(newContent.length());
        return newContent.length() > 100 ? newContent.substring(0,97)+"..." : newContent;
    }
}


