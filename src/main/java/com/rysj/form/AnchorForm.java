package com.rysj.form;

import lombok.Data;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-08 上午 10:39
 */
@Data
public class AnchorForm {

    @NotEmpty(message = "姓名不能为空！")
    private String name;

    @NotEmpty(message = "手机不能为空！")
    private String phone;

    @NotEmpty(message = "备注不能为空！")
    private String remark;

}
