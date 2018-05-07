package com.rysj.repository;

import com.rysj.dataobject.JobInfo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-09 上午 9:37
 */
public interface JobInfoRepository extends JpaRepository<JobInfo,Integer> {

    List<JobInfo> findAllByShowStatus(Integer showStatus);
}
