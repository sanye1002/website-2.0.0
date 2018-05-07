package com.rysj.service.impl;

import com.rysj.dataobject.UserInfo;
import com.rysj.repository.UserInfoRepository;
import com.rysj.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-02 上午 11:18
 */
@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    UserInfoRepository repository;

    @Override
    public UserInfo findByPhoneAndPassword(String phone, String password) {

        return repository.findByPhoneAndPassword(phone,password);
    }
}
