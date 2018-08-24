package com.rysj.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author  Administrator
 * @Date    2018/5/23 17:43
 * @Desc    切割工具
 */
public class SplitUtil {

    /**
     * 逗号切割
     */
    public static List<String> splitComme(String s){

        List<String> list = new ArrayList<String>();

        if (s!=""){
            String[] ss = s.split(",");
            for (int i = 0; i < ss.length; i++){
                list.add(ss[i]);
            }
        }
        return list;
    }

    /**
     * 特殊切割
     */
    public static List<String> splitCJ(String s){
        List<String> list = new ArrayList<String>();

        if (s!=""){
            String[] ss = s.split("!@#");
            for (int i = 0; i < ss.length; i++){
                list.add(ss[i]);
            }
        }
        return list;
    }




}
