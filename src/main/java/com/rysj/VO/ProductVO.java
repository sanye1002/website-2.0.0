package com.rysj.VO;

import lombok.Data;

import java.util.List;

/**
 * @Author zhaoxiang
 * @Date 2018/08/23
 * @Desc
 */
@Data
public class ProductVO {

    private Integer id;

    private String topTitle;

    private List<String> imgUrl;

    private String videoUrl;

    private String content;

    private Integer contentShow;

    private String bottomTitle;

    private String crateTime;
}
