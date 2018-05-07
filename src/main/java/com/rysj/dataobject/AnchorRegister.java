package com.rysj.dataobject;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-08 上午 10:52
 */
@Data
@Entity
public class AnchorRegister {

    @Id
    @GeneratedValue
    private Integer id;

    private String name;

    private String phone;

    private String remark;

    private String createTime;



}
