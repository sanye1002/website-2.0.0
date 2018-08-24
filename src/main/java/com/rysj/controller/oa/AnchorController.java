package com.rysj.controller.oa;

import com.rysj.VO.ResultVO;
import com.rysj.dataobject.AnchorInfo;
import com.rysj.exception.WebException;
import com.rysj.form.AnchorInfoForm;
import com.rysj.service.AnchorInfoService;
import com.rysj.utils.ResultVOUtil;
import com.rysj.utils.SortTools;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.repository.query.Param;
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
 * @create 2018-03-21 下午 4:53
 */
@Controller
@RequestMapping("/oa/anchor")
@Slf4j
public class AnchorController {

    @Autowired
    private AnchorInfoService anchorInfoService;

    @GetMapping("/index")
    public ModelAndView anchorAdd(Map<String, Object> map) {
        map.put("pageId", 2);
        AnchorInfo anchorInfo = new AnchorInfo();
        map.put("anchor",anchorInfo);
        return new ModelAndView("oa/view/anchorAdd", map);
    }
    @GetMapping("/detail")
    public ModelAndView detail(Map<String, Object> map,@RequestParam("id") Integer id) {
        map.put("pageId", 2);
        AnchorInfo anchorInfo = anchorInfoService.findOne(id);

        map.put("anchor",anchorInfo);
        return new ModelAndView("oa/view/anchorDetail", map);
    }




    /*
        @PostMapping("/save")
        public ModelAndView save(@Valid AnchorInfoForm anchorInfoForm,
                                 BindingResult bindingResult,
                                 Map<String,Object> map){

            if (bindingResult.hasErrors()){
                map.put("message",bindingResult.getFieldError().getDefaultMessage());
                map.put("url","/oa/anchor/index");
                //调到错误页面
                return new ModelAndView("oa/common/error",map);
            }

            AnchorInfo anchorInfo = new AnchorInfo();
            try {
                if (anchorInfoForm.getId()!=null){
                    anchorInfo = anchorInfoService.findOne(anchorInfoForm.getId());
                }
                BeanUtils.copyProperties(anchorInfoForm,anchorInfo);
                anchorInfoService.save(anchorInfo);
            } catch (WebException e){
                map.put("message",e.getMessage());
                map.put("url","/oa/anchor/index");
                //调到错误页面
                return new ModelAndView("oa/common/error",map);
            }
                map.put("url","/oa/anchor/index");
            return new ModelAndView("oa/common/success",map);
        }*/
    @ResponseBody
    @PostMapping("/save")
    public ResultVO<Map<String, Object>> save(@Valid AnchorInfoForm anchorInfoForm,
                                              BindingResult bindingResult) {

        Map<String, Object> map = new HashMap<>();
        if (bindingResult.hasErrors()) {
            map.put("message", bindingResult.getFieldError().getDefaultMessage());
            map.put("url", "/oa/anchor/index");
            //调到错误页面
            log.info("【保存艺人】 error_message = {}", map.get("message"));
            return ResultVOUtil.error(100, bindingResult.getFieldError().getDefaultMessage());
        }
        AnchorInfo anchorInfo = new AnchorInfo();
        try {
            if (anchorInfoForm.getId() != null) {
                anchorInfo = anchorInfoService.findOne(anchorInfoForm.getId());
                //判断内容
                if(anchorInfoForm.getContent() == null|| anchorInfoForm.getContent()==""){

                    anchorInfoForm.setContent(anchorInfo.getContent());
                }
                anchorInfoForm.setShowStatus(anchorInfo.getShowStatus());
            }

            BeanUtils.copyProperties(anchorInfoForm, anchorInfo);
            log.info("【更新】content={}",anchorInfo.getContent());
            anchorInfoService.save(anchorInfo);
        } catch (WebException e) {
            map.put("message", e.getMessage());
            map.put("url", "/oa/anchor/index");
            //调到错误
            log.info("【保存艺人】 error_message = {}", map.get("message"));
            return ResultVOUtil.error(100, e.getMessage());
        }
        map.put("url", "/oa/anchor/index");
        log.info("【保存艺人】 成功 = {}", anchorInfo.getNickname());
        return ResultVOUtil.success(map);
    }

    /**
     * @param page 第几页开始
     * @param size 每页的数据
     * @param map
     * @return
     */


    @GetMapping("/list")
    public ModelAndView list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                             @RequestParam(value = "size", defaultValue = "6") Integer size,
                             Map<String, Object> map) {

        PageRequest request = new PageRequest(page - 1, size, SortTools.basicSort());
        Page<AnchorInfo> infoPage = anchorInfoService.findList(request);
        map.put("pageId", 1);
        map.put("pageContent", infoPage);
        map.put("url", "/oa/anchor/list");
        map.put("size", size);
        map.put("currentPage", page);
        return new ModelAndView("oa/view/anchorList", map);
    }

    @PostMapping("/delete")
    @ResponseBody
    public ResultVO<Map<String, Object>> delete(@Param(value = "id") Integer id) {
        Map<String, Object> map = new HashMap<>();
        anchorInfoService.delete(id);
        return ResultVOUtil.success();
    }
}
