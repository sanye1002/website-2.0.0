package com.rysj.controller.rysj;

import com.rysj.dataobject.JobInfo;
import com.rysj.dataobject.TeamInfo;
import com.rysj.service.JobInfoService;
import com.rysj.service.TeamInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-27 上午 11:08
 */
@Controller
@RequestMapping("/rysj/about")
public class AboutPageController {
    @Autowired
    private TeamInfoService service;

    @Autowired
    private JobInfoService jobInfoService;
    @GetMapping("/team")
    public ModelAndView team(Map<String, Object> map) {
        map.put("type", 2);
        List<TeamInfo> teamInfoList = service.findAllByShowStatus(1);
        map.put("teamInfoList",teamInfoList);
        return new ModelAndView("rysj/view/team", map);
    }

    @GetMapping("/company")

    public ModelAndView company(Map<String, Object> map) {
        map.put("type", 1);
        return new ModelAndView("rysj/view/company", map);
    }
    @GetMapping("/job")
    public ModelAndView job(Map<String, Object> map) {
        map.put("type", 1);
        List<JobInfo> jobInfoList = jobInfoService.findAllByShowStatus(1);
        map.put("jobInfoList",jobInfoList);
        return new ModelAndView("rysj/view/job", map);
    }
    @GetMapping("/cooperation")
    public ModelAndView cooperation(Map<String, Object> map) {
        map.put("type", 2);
        return new ModelAndView("rysj/view/cooperation", map);
    }
}
