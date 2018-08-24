package com.rysj.service;

import com.rysj.VO.ResultVO;
import com.rysj.dataobject.ProductRegister;
import com.rysj.form.ProductRegisterFrom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Map;

/**
 * @Author zhaoxiang
 * @Date 2018/08/24
 * @Desc
 */
public interface ProductRegisterService {
    ResultVO<Map<String, Object>> save(ProductRegisterFrom productRegisterFrom);

    Page<ProductRegister> findAllByPage(Pageable pageable);
}
