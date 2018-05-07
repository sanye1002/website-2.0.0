package com.rysj.repository;

import com.rysj.dataobject.TeamDetail;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-20 下午 4:55
 */
public interface TeamDetailRepository extends JpaRepository<TeamDetail,Integer> {

}
