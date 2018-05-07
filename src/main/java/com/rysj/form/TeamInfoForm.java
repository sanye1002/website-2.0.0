package com.rysj.form;

import lombok.Data;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-04 下午 3:53
 */
@Data
public class TeamInfoForm {

    private Integer id;

    private String pathUrl;
    /**
     * 展示 0不展示 1 展示 默认0
     */
    private Integer showStatus;
}
