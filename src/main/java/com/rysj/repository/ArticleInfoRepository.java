package com.rysj.repository;

import com.rysj.dataobject.ArticleInfo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-20 下午 4:53
 */
public interface ArticleInfoRepository extends JpaRepository<ArticleInfo, Integer> {

    Page<ArticleInfo> findAllByType(Pageable pageable, Integer type);
}
