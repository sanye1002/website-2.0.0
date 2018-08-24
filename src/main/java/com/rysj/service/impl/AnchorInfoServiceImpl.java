package com.rysj.service.impl;

import com.rysj.dataobject.AnchorInfo;
import com.rysj.repository.AnchorInfoRepository;
import com.rysj.service.AnchorInfoService;
import com.rysj.utils.GetTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-21 下午 5:49
 */
@Service
@Transactional
public class AnchorInfoServiceImpl implements AnchorInfoService {

    @Autowired
    private AnchorInfoRepository repository;

    @Override
    public AnchorInfo save(AnchorInfo anchorInfo) {
        if (anchorInfo.getId() == null){
            anchorInfo.setCreateTime(GetTimeUtil.getMMdd());
        }
        return repository.save(anchorInfo);
    }

    @Override
    public Page<AnchorInfo> findList(Pageable pageable) {
        Page<AnchorInfo> anchorInfoPage = repository.findAll(pageable);
        List<AnchorInfo> anchorInfoList = anchorInfoPage.getContent();
        return new PageImpl<>(anchorInfoList,pageable,anchorInfoPage.getTotalElements());
    }

    @Override
    public void delete(Integer id) {
        repository.delete(id);
    }

    @Override
    public AnchorInfo findOne(Integer id) {

        return repository.findOne(id);
    }

    @Override
    public List<AnchorInfo> findAllByShowStatus(Integer showStatus) {
        return repository.findAllByShowStatus(showStatus);
    }

    @Override
    public List<AnchorInfo> findAll() {
        return repository.findAll();
    }
}
