package com.rysj.form;

import lombok.Data;

import javax.validation.constraints.NotNull;


/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-29 下午 6:05
 */
@Data
public class UserInfoForm {

    @NotNull(message = "密码不能为空!")
    private String password;

    @NotNull(message = "手机号码不能为空")
    private String phone;

}
