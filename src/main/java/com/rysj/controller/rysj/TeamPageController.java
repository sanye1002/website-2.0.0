package com.rysj.controller.rysj;

import com.rysj.dataobject.TeamInfo;
import com.rysj.service.TeamInfoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-08 上午 9:24
 */
@Controller
@Slf4j
@RequestMapping("/rysj/team")
public class TeamPageController {
    @Autowired
    private TeamInfoService service;

    @GetMapping("/info")
    public ModelAndView info(Map<String, Object> map) {

        List<TeamInfo> teamInfoList = service.findAllByShowStatus(1);
        map.put("teamInfoList",teamInfoList);
        return new ModelAndView("rysj/view/team");
    }
}
