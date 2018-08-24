package com.rysj.repository;

import com.rysj.dataobject.AppOpen;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @Author zhaoxiang
 * @Date 2018/08/22
 * @Desc
 */
public interface AppOpenRepository extends JpaRepository<AppOpen,Integer> {

    Page<AppOpen> findAllByContentShow(Pageable pageable, Integer show);

    List<AppOpen> findAllByContentShow(Integer show);

}
