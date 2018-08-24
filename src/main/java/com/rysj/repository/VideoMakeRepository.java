package com.rysj.repository;

import com.rysj.dataobject.VideoMake;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @Author zhaoxiang
 * @Date 2018/08/22
 * @Desc
 */
public interface VideoMakeRepository extends JpaRepository<VideoMake,Integer> {
   Page<VideoMake> findAllByContentShow(Pageable pageable,Integer show);

   List<VideoMake> findAllByContentShow(Integer show);

}
