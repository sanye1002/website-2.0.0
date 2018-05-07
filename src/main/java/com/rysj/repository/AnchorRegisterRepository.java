package com.rysj.repository;

import com.rysj.dataobject.AnchorRegister;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-08 上午 10:55
 */
public interface AnchorRegisterRepository extends JpaRepository<AnchorRegister,Integer> {
    Page<AnchorRegister> findAll(Pageable pageable);
}
