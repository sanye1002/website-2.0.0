package com.rysj.handler;

import com.rysj.exception.WebAuthorizeException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-02 下午 2:52
 */
@ControllerAdvice
public class WebExceptionHandler {

    //拦截登录异常
    @ExceptionHandler(value = WebAuthorizeException.class)
    public ModelAndView handlerAuthorException(){
        return new ModelAndView("redirect:/oa/login/index");
    }
}
