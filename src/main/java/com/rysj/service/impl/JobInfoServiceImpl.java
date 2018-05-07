package com.rysj.service.impl;

import com.rysj.dataobject.JobInfo;
import com.rysj.repository.JobInfoRepository;
import com.rysj.service.JobInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-09 上午 9:46
 */
@Service

public class JobInfoServiceImpl implements JobInfoService{

    @Autowired
    private JobInfoRepository repository;

    @Override
    public JobInfo save(JobInfo jobInfo) {
        return repository.save(jobInfo);
    }

    @Override
    public List<JobInfo> findAllByShowStatus(Integer showStatus) {
        return repository.findAllByShowStatus(showStatus);
    }

    @Override
    public void delete(Integer id) {
        repository.delete(id);
    }

    @Override
    public JobInfo findOne(Integer id) {
        return repository.findOne(id);
    }

    @Override
    public Page<JobInfo> findAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public List<JobInfo> finAll() {
        return repository.findAll();
    }
}
