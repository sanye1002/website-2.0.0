package com.rysj.controller.rysj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-27 下午 2:10
 */
@Controller
@RequestMapping("/rysj/recruit")
public class RecruitPageController {

    @GetMapping("/anchor")
    public ModelAndView anchor(Map<String,Object> map){

        return new ModelAndView("rysj/view/recruitAnchor",map);
    }
}
