package com.rysj.dataobject;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Data
@Entity
public class VideoMake {

    @Id
    @GeneratedValue
    private Integer id;

    private String topTitle;

    private String imgUrl;

    private String videoUrl;

    @Column(columnDefinition = "TEXT")
    private String content;

    private Integer contentShow;

    private String bottomTitle;

    private String crateTime;

}
