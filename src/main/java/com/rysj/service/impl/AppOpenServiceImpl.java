package com.rysj.service.impl;

import com.rysj.VO.ProductVO;
import com.rysj.VO.ResultVO;
import com.rysj.dataobject.AppOpen;
import com.rysj.repository.AppOpenRepository;
import com.rysj.service.AppOpenService;
import com.rysj.utils.GetTimeUtil;
import com.rysj.utils.ResultVOUtil;
import com.rysj.utils.SplitUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * author：zhaoxiang
 * time： 2018-08-22
 */
@Service
public class AppOpenServiceImpl implements AppOpenService {

    @Autowired
    private AppOpenRepository repository;


    @Override
    public ResultVO<Map<String,Object>> save(AppOpen appOpen) {
        Map<String,Object> map = new HashMap<>();
        if (appOpen.getContentShow() == null){
            appOpen.setContentShow(1);
            appOpen.setCrateTime(GetTimeUtil.getTime());
        }
        AppOpen result = repository.save(appOpen);
        if (result.getId() == null){
            return ResultVOUtil.error(100,"保存失败");
        }
        map.put("appOpen",appOpen);
        return ResultVOUtil.success(map);
    }

    @Override
    public Map<String, Object> findALl(Integer status) {
        return null;
    }

    @Override
    public ResultVO<Map<String,Object>> delete(Integer id) {
        AppOpen appOpen = repository.findOne(id);
        if (appOpen == null){
            return ResultVOUtil.error(100,"此条数据无效");
        }
        appOpen.setContentShow(0);
        repository.save(appOpen);
        return ResultVOUtil.success();
    }

    @Override
    public AppOpen findOne(Integer id) {

        return repository.findOne(id);
    }

    @Override
    public Page<AppOpen> findAllByContentShow(Pageable pageable, Integer show) {

        return repository.findAllByContentShow(pageable,show);
    }

    @Override
    public List<ProductVO> findAll2ProductVO(Integer show) {

        List<AppOpen> list = repository.findAllByContentShow(show);

        List<ProductVO> productVOList = new ArrayList<>();
        System.out.println("-----------------");
        if (!list.isEmpty()){
            list.forEach( e-> {
                ProductVO productVO = new ProductVO();
                BeanUtils.copyProperties(e,productVO);
                productVO.setImgUrl(SplitUtil.splitComme(e.getImgUrl()));
                productVOList.add(productVO);
            });
        }

        return productVOList;
    }
}
