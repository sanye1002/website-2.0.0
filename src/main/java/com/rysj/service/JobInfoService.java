package com.rysj.service;

import com.rysj.dataobject.JobInfo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-09 上午 9:40
 */
public interface JobInfoService {
    /**
     *
     * @param jobInfo
     * @return
     */
    JobInfo save(JobInfo jobInfo);

    /**
     *
     * @param showStatus
     * @return
     */
    List<JobInfo> findAllByShowStatus(Integer showStatus);

    /**
     *
     * @param id
     */
    void delete(Integer id);

    /**
     *
     * @param id
     * @return
     */
    JobInfo findOne(Integer id);

    /**
     *
     * @param pageable
     * @return
     */
    Page<JobInfo> findAll(Pageable pageable);

    /**
     *
     * @return
     */
    List<JobInfo> finAll();
}
