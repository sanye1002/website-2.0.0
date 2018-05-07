package com.rysj.repository;

import com.rysj.dataobject.TeamInfo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-20 下午 4:55
 */
public interface TeamInfoRepository extends JpaRepository<TeamInfo,Integer>{

    List<TeamInfo> findAllByShowStatus(Integer showStatus);
}
