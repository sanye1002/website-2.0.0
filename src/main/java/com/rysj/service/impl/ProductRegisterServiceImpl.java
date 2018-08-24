package com.rysj.service.impl;

import com.rysj.VO.ResultVO;
import com.rysj.dataobject.ProductRegister;
import com.rysj.form.ProductRegisterFrom;
import com.rysj.repository.ProductRegisterRepository;
import com.rysj.service.ProductRegisterService;
import com.rysj.utils.ResultVOUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author zhaoxiang
 * @Date 2018/08/24
 * @Desc
 */
@Service
public class ProductRegisterServiceImpl implements ProductRegisterService {

    @Autowired
    private ProductRegisterRepository registerRepository;

    @Override
    public ResultVO<Map<String, Object>> save(ProductRegisterFrom productRegisterFrom) {
        ProductRegister productRegister = new ProductRegister();
        BeanUtils.copyProperties(productRegisterFrom,productRegister);
        Map<String, Object> map = new HashMap<>();
        map.put("data",registerRepository.save(productRegister));
        return ResultVOUtil.success(map);
    }

    @Override
    public Page<ProductRegister> findAllByPage(Pageable pageable) {

        return registerRepository.findAll(pageable);
    }
}
