package com.rysj.service;

import com.rysj.VO.ProductVO;
import com.rysj.VO.ResultVO;
import com.rysj.dataobject.AppOpen;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


import java.util.List;
import java.util.Map;

public interface AppOpenService {

    // 保存
    ResultVO<Map<String,Object>> save(AppOpen appOpen);
    //
    Map<String,Object> findALl(Integer status);
    //
    ResultVO<Map<String,Object>> delete(Integer id);

    AppOpen findOne(Integer id);

    Page<AppOpen> findAllByContentShow(Pageable pageable, Integer show);

    List<ProductVO> findAll2ProductVO(Integer show);
}
