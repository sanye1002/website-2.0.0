package com.rysj.dataobject;

import lombok.Data;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Data
@Entity
public class ProductRegister {

    @Id
    @GeneratedValue
    private Integer id;

    private String username;

    private String phone;

    private String sex;

    private String description;

    private String crateTime;

    private Integer connectionStatus;

}
