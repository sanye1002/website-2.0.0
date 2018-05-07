package com.rysj.aspect;

import com.rysj.exception.WebAuthorizeException;
import com.rysj.exception.WebException;
import com.rysj.utils.CookieUtil;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-02 下午 2:32
 */
@Aspect
@Component
public class UserAuthorizeAspect {

    @Pointcut("execution(public * com.rysj.controller.oa.*.*(..))"
    +"&& !execution(public * com.rysj.controller.oa.LoginController.*(..))")
    public void verify(){

    }
    @Before("verify()")
    public  void doVerify(){
        //得到request
        ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = servletRequestAttributes.getRequest();
        //查询cookie
        Cookie cookie = CookieUtil.get(request,"phone");
        if (cookie == null){
            throw new WebAuthorizeException();
        }
    }
}
