package com.rysj.service;

import com.rysj.dataobject.AnchorRegister;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-08 上午 10:57
 */
public interface AnchorRegisterService {

    /**
     *
     * @param anchorRegister
     * @return
     */
    AnchorRegister save(AnchorRegister anchorRegister);

    /**
     *
     * @param pageable
     * @return
     */
    Page<AnchorRegister> findAll(Pageable pageable);

    /**
     *
     * @param id
     */
    void delete(Integer id);

}
