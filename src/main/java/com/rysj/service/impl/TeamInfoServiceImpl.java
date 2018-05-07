package com.rysj.service.impl;

import com.rysj.dataobject.TeamInfo;
import com.rysj.repository.TeamInfoRepository;
import com.rysj.service.TeamInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-04 下午 3:30
 */
@Service
@Transactional
public class TeamInfoServiceImpl implements TeamInfoService {

    @Autowired
    private TeamInfoRepository repository;

    @Override
    public TeamInfo save(TeamInfo teamInfo) {
        return repository.save(teamInfo);
    }

    @Override
    public void delete(Integer id) {
        repository.delete(id);
    }

    @Override
    public Page<TeamInfo> findAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public List<TeamInfo> findAllByShowStatus(Integer showStatus) {
        return repository.findAllByShowStatus(showStatus);
    }

    @Override
    public TeamInfo findOne(Integer id) {
        return repository.findOne(id);
    }

    @Override
    public List<TeamInfo> findAll() {
        return repository.findAll();
    }
}
