package com.rysj.service;

import com.rysj.VO.ProductVO;
import com.rysj.VO.ResultVO;
import com.rysj.dataobject.VideoMake;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

/**
 * @Author zhaoxiang
 * @Date 2018/08/22
 * @Desc
 */
public interface VideoMakeService {

    // 保存
    ResultVO<Map<String,Object>> save(VideoMake videoMake);
    //
    Map<String,Object> findALl(Integer status);
    //
    ResultVO<Map<String,Object>> delete(Integer id);

    VideoMake findOne(Integer id);

    Page<VideoMake> findAllByContentShow(Pageable pageable, Integer show);

    List<ProductVO> findAll2ProductVO(Integer show);
}
