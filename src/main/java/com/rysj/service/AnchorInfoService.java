package com.rysj.service;

import com.rysj.dataobject.AnchorInfo;
import com.rysj.utils.SortTools;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-21 下午 5:30
 */
public interface AnchorInfoService {

    /**
     *  保存艺人
     * @param anchorInfo
     * @return
     */
    AnchorInfo save(AnchorInfo anchorInfo);

    /**
     * 查询所有
     * @param pageable
     * @return
     */
    Page<AnchorInfo> findList(Pageable pageable);

    /**
     * 删除艺人
     * @param id
     */
    void delete(Integer id);
    /**
     * id查询
     * @param id
     * @return
     */
    AnchorInfo findOne(Integer id);

    /**
     *
     * @param showStatus
     * @return
     */
    List<AnchorInfo> findAllByShowStatus(Integer showStatus);

    /**
     *
     * @return
     */
    List<AnchorInfo> findAll();



}
