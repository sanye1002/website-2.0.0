package com.rysj.repository;

import com.rysj.VO.ResultVO;
import com.rysj.dataobject.ProductRegister;
import com.rysj.form.ProductRegisterFrom;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Map;

/**
 * @Author zhaoxiang
 * @Date 2018/08/24
 * @Desc
 */
public interface ProductRegisterRepository extends JpaRepository<ProductRegister, Integer> {


}
