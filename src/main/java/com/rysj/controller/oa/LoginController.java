package com.rysj.controller.oa;

import com.rysj.VO.ResultVO;
import com.rysj.dataobject.UserInfo;
import com.rysj.form.UserInfoForm;
import com.rysj.repository.UserInfoRepository;
import com.rysj.utils.CookieUtil;
import com.rysj.utils.ResultVOUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-29 下午 5:00
 */
@Controller
@RequestMapping("/oa/login")
@Slf4j
public class LoginController {
    @Autowired
    private UserInfoRepository repository;

    @GetMapping("/index")
    public ModelAndView index(Map<String, Object> map) {
        map.put("message", "");
        return new ModelAndView("oa/view/login", map);
    }

    @PostMapping("/commit")
    public ModelAndView commit(@Valid UserInfoForm userInfoForm,
                               BindingResult bindingResult, HttpServletResponse response) {

        Map<String, Object> map = new HashMap<>();
        if (bindingResult.hasErrors()) {
            map.put("message", bindingResult.getFieldError().getDefaultMessage());
            map.put("url", "/oa/login/index");
            //调到错误页面
            log.info("【登录】 error_message = {}", map.get("message"));
            return new ModelAndView("oa/view/login", map);
        }
        UserInfo userInfo = repository.findByPhoneAndPassword(userInfoForm.getPhone(), userInfoForm.getPassword());
        if (userInfo == null) {
            map.put("message", "账号密码错误");
            map.put("url", "/oa/login/index");
            //调到错误页面
            log.info("【登录】 error_message = {}", map.get("message"));
            return new ModelAndView("oa/view/login", map);
        }
        map.put("message", "登录成功");
        map.put("url", "/oa/anchor/index");
        //设置cookie
        CookieUtil.set(response,"phone",userInfo.getPhone(),60*60*3);
        return new ModelAndView("oa/common/success", map);
    }

}
