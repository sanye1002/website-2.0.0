package com.rysj.service.impl;

import com.rysj.VO.ProductVO;
import com.rysj.VO.ResultVO;
import com.rysj.dataobject.VideoMake;
import com.rysj.repository.VideoMakeRepository;
import com.rysj.service.VideoMakeService;
import com.rysj.utils.GetTimeUtil;
import com.rysj.utils.ResultVOUtil;
import com.rysj.utils.SplitUtil;
import lombok.extern.slf4j.Slf4j;
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
 * @Author zhaoxiang
 * @Date 2018/08/22
 * @Desc
 */
@Service
@Slf4j
public class VideoMakeServiceImpl implements VideoMakeService {

    @Autowired
    private VideoMakeRepository repository;

    @Override
    public ResultVO<Map<String, Object>> save(VideoMake videoMake) {
        Map<String, Object> map = new HashMap<>();
        if (videoMake.getContentShow() == null) {
            videoMake.setContentShow(1);
            videoMake.setCrateTime(GetTimeUtil.getTime());
        }
        VideoMake result = repository.save(videoMake);
        if (result.getId() == null) {
            return ResultVOUtil.error(100, "保存失败");
        }
        map.put("videoMake", videoMake);
        return ResultVOUtil.success(map);
    }

    @Override
    public Map<String, Object> findALl(Integer status) {
        return null;
    }

    @Override
    public ResultVO<Map<String, Object>> delete(Integer id) {
        VideoMake videoMake = repository.findOne(id);
        if (videoMake == null) {
            return ResultVOUtil.error(100, "此条数据无效");
        }
        videoMake.setContentShow(0);
        repository.save(videoMake);
        return ResultVOUtil.success();
    }

    @Override
    public VideoMake findOne(Integer id) {
        return repository.findOne(id);
    }

    @Override
    public Page<VideoMake> findAllByContentShow(Pageable pageable, Integer show) {
        return repository.findAllByContentShow(pageable, show);
    }

    @Override
    public List<ProductVO> findAll2ProductVO(Integer show) {
        List<VideoMake> list = repository.findAllByContentShow(show);
        List<ProductVO> productVOList = new ArrayList<>();

        log.info("video");
        if (!list.isEmpty()) {
            list.forEach(e -> {
                ProductVO productVO = new ProductVO();
                BeanUtils.copyProperties(e, productVO);
                productVO.setImgUrl(SplitUtil.splitComme(e.getImgUrl()));
                productVOList.add(productVO);
            });
        }
        return productVOList;
    }
}
