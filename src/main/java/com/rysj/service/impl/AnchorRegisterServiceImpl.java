package com.rysj.service.impl;

import com.rysj.dataobject.AnchorInfo;
import com.rysj.dataobject.AnchorRegister;
import com.rysj.repository.AnchorRegisterRepository;
import com.rysj.service.AnchorInfoService;
import com.rysj.service.AnchorRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-08 上午 11:03
 */
@Service
public class AnchorRegisterServiceImpl implements AnchorRegisterService {

    @Autowired
    private  AnchorRegisterRepository repository;


    @Override
    public AnchorRegister save(AnchorRegister anchorRegister) {
        return repository.save(anchorRegister);
    }

    @Override
    public Page<AnchorRegister> findAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public void delete(Integer id) {
        repository.delete(id);
    }
}
