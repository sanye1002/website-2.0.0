package com.rysj.service;

import com.rysj.dataobject.UserInfo;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-02 上午 11:17
 */
public interface UserInfoService {
    /**
     * 登录
     * @param phone
     * @param password
     * @return
     */
    UserInfo findByPhoneAndPassword(String phone, String password);


}
