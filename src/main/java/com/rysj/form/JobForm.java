package com.rysj.form;

import lombok.Data;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-09 上午 10:35
 */
@Data
public class JobForm {

    private Integer id;

    private String title;

    private String content;

    private Integer showStatus;
}
