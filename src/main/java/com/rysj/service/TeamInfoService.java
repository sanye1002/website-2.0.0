package com.rysj.service;

import com.rysj.dataobject.TeamInfo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-04 下午 3:18
 */
public interface TeamInfoService {
    /**
     * 保存
     * @param teamInfo
     * @return
     */
    TeamInfo save(TeamInfo teamInfo);

    /**
     * 删除
     * @param id
     */
    void delete(Integer id);

    /**
     * 查询
     * @param pageable
     * @return
     */
    Page<TeamInfo> findAll(Pageable pageable);

    /**
     * 查询
     * @param showStatus
     * @return
     */
    List<TeamInfo> findAllByShowStatus(Integer showStatus);

    /**
     * 按id查询
     * @param id
     * @return
     */
    TeamInfo findOne(Integer id);

    /**
     * 查询
     * @return
     */
    List<TeamInfo> findAll();
}
