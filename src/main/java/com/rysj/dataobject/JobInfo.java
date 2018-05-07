package com.rysj.dataobject;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-09 上午 9:35
 */
@Data
@Entity
public class JobInfo {
    @Id
    @GeneratedValue
    private Integer id;

    private String title;

    private String content;

    private Integer showStatus;
}
