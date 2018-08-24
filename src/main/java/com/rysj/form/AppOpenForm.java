package com.rysj.form;

import lombok.Data;

/**
 * @Author zhaoxiang
 * @Date 2018/08/23
 * @Desc
 */
@Data
public class AppOpenForm {

    private Integer id;

    private String topTitle;

    private String imgUrl;

    private String videoUrl;


    private String content;

    private Integer contentShow;

    private String bottomTitle;
}
