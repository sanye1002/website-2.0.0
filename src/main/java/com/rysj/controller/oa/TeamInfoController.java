package com.rysj.controller.oa;

import com.rysj.VO.ResultVO;
import com.rysj.dataobject.TeamInfo;
import com.rysj.exception.WebException;
import com.rysj.form.TeamInfoForm;
import com.rysj.service.TeamInfoService;
import com.rysj.utils.ResultVOUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-04 下午 3:37
 */
@Controller
@Slf4j
@RequestMapping("/oa/team")
public class TeamInfoController {

    @Autowired
    private TeamInfoService service;

    @PostMapping("/save")
    @ResponseBody
    public ResultVO<Map<String, Object>> save(@Valid TeamInfoForm teamInfoForm,
                                              BindingResult bindingResult) {
        Map<String, Object> map = new HashMap<>();
        if (bindingResult.hasErrors()) {
            log.info("【团队图片信息保存】 失败信息={}", bindingResult.getFieldError().getDefaultMessage());
            return ResultVOUtil.error(100, bindingResult.getFieldError().getDefaultMessage());
        }
        TeamInfo teamInfo = new TeamInfo();
        try {
            if (teamInfoForm.getId() != null) {
                teamInfo = service.findOne(teamInfoForm.getId());
                teamInfo.setShowStatus(teamInfoForm.getShowStatus());
                service.save(teamInfo);
                return ResultVOUtil.success();
            } else {
                BeanUtils.copyProperties(teamInfoForm, teamInfo);
            }

        } catch (WebException e) {
            return ResultVOUtil.error(100, e.getMessage());
        }
        service.save(teamInfo);
        return ResultVOUtil.success();
    }

    @GetMapping("/list")
    public ModelAndView list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                             @RequestParam(value = "size", defaultValue = "6") Integer size,
                             Map<String, Object> map) {
        PageRequest request = new PageRequest(page - 1, size);
        Page<TeamInfo> teamInfoPage = service.findAll(request);
        map.put("pageId", 7);
        map.put("pageContent", teamInfoPage);
        map.put("url", "/oa/team/list");
        map.put("size", size);
        map.put("currentPage", page);
        return new ModelAndView("oa/view/teamInfo",map);
    }
}
