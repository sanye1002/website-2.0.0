package com.rysj.form;

import com.rysj.utils.GetTimeUtil;
import lombok.Data;

/**
 * @Author zhaoxiang
 * @Date 2018/08/24
 * @Desc
 */
@Data
public class ProductRegisterFrom {

    private String username;

    private String phone;

    private String sex = getSex() == "1"? "先生":"女士";

    private String description;

    private String crateTime = GetTimeUtil.getDate();

    private Integer connectionStatus =1;
}
