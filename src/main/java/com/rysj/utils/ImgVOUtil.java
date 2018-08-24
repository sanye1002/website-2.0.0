package com.rysj.utils;


import com.rysj.VO.ImgVO;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-16 下午 6:41
 */
public class ImgVOUtil {
    public static ImgVO success(Integer id, Object object){
        ImgVO imgVO = new ImgVO();
        imgVO.setId(id);
        imgVO.setStart(0);
        imgVO.setTitle("图片");
        imgVO.setData(object);
        return imgVO;
    }
}
