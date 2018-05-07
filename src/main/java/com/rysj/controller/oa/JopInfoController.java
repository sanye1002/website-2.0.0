package com.rysj.controller.oa;

import com.rysj.VO.ResultVO;
import com.rysj.dataobject.JobInfo;
import com.rysj.exception.WebException;
import com.rysj.form.JobForm;
import com.rysj.service.JobInfoService;
import com.rysj.utils.ResultVOUtil;
import com.rysj.utils.SortTools;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.Map;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-09 上午 10:12
 */
@Controller
@RequestMapping("/oa/job")
@Slf4j
public class JopInfoController {

    @Autowired
    private JobInfoService jobInfoService;

    @GetMapping("/list")
    public ModelAndView list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                             @RequestParam(value = "size", defaultValue = "10") Integer size,
                             Map<String, Object> map) {
        PageRequest pageRequest = new PageRequest(page - 1, size, SortTools.basicSort());
        Page<JobInfo> jobInfoPage = jobInfoService.findAll(pageRequest);
        map.put("pageId", 9);
        map.put("pageContent", jobInfoPage);
        map.put("url", "/oa/job/list");
        map.put("size", size);
        map.put("currentPage", page);
        return new ModelAndView("oa/view/jobList", map);
    }

    @PostMapping("/save")
    @ResponseBody
    public ResultVO<Map<String, Object>> save(@Valid JobForm jobForm) {
        JobInfo jobInfo = new JobInfo();
        try {
            if (jobForm.getId() != null) {
                jobInfo = jobInfoService.findOne(jobForm.getId());
                jobForm.setContent(jobInfo.getContent());
                jobForm.setTitle(jobInfo.getTitle());
            }
        } catch (WebException w) {
            return ResultVOUtil.error(100, w.getMessage());
        }
        BeanUtils.copyProperties(jobForm,jobInfo);
        jobInfoService.save(jobInfo);
        return ResultVOUtil.success();
    }

    @PostMapping("/delete")
    @ResponseBody
    public ResultVO<Map<String, Object>> delete(@RequestParam(value = "id") Integer id) {
        if (id == null) {
            return ResultVOUtil.error(100, "id为空");
        }
        jobInfoService.delete(id);
        return ResultVOUtil.success();
    }

    @GetMapping("/index")
    public ModelAndView index(Map<String, Object> map) {
        map.put("pageId", 10);
        return new ModelAndView("oa/view/jobAdd", map);
    }
}
