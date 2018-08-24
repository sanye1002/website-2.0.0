package com.rysj.controller.oa;

import com.rysj.VO.ImgVO;
import com.rysj.VO.ResultVO;
import com.rysj.dataobject.AppOpen;
import com.rysj.form.AppOpenForm;
import com.rysj.service.AppOpenService;
import com.rysj.utils.ImgVOUtil;
import com.rysj.utils.ResultVOUtil;
import com.rysj.utils.SplitUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author zhaoxiang
 * @Date 2018/08/23
 * @Desc 开发中心添加后台
 */
@Controller
@Slf4j
@RequestMapping("/oa/app")
public class AppOpenController {

    @Autowired
    private AppOpenService appOpenService;

    @GetMapping("/index")
    public ModelAndView index(Map<String,Object> map,
                              @RequestParam(value = "id",defaultValue = "0")Integer id){
        AppOpen appOpen = new AppOpen();
        if (id != 0){
            appOpen = appOpenService.findOne(id);
        }
        map.put("pageId",21);
        map.put("appOpen",appOpen);
        return new ModelAndView("oa/view/appDescriptionAdd",map);
    }

    /**
     *
     * @param map
     * @param id
     * @param appOpenForm
     * @param bindingResult
     * @return
     */
    @PostMapping("/save")
    @ResponseBody
    public ResultVO<Map<String,Object>> save(Map<String,Object> map,
                                             @RequestParam(value = "id",defaultValue = "0")Integer id,
                                             @Valid AppOpenForm appOpenForm,
                                             BindingResult bindingResult){

        AppOpen appOpen = new AppOpen();
        if (id != 0){
            appOpen = appOpenService.findOne(id);
        }
        BeanUtils.copyProperties(appOpenForm,appOpen);
        return appOpenService.save(appOpen);

    }

    /**
     *
     * @param page
     * @param size
     * @param map
     * @return ModelAndView
     */
    @GetMapping("/list")
    public ModelAndView list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                             @RequestParam(value = "size", defaultValue = "6") Integer size,
                             Map<String, Object> map){

        Pageable pageable = new PageRequest(page-1,size);
        Page<AppOpen> appOpenPage = appOpenService.findAllByContentShow(pageable,1);
        map.put("pageId", 22);
        map.put("pageContent", appOpenPage);
        map.put("url", "/oa/app/list");
        map.put("size", size);
        map.put("currentPage", page);
        return new ModelAndView("oa/view/appDescriptionList",map);
    }

    /**
     *
     * @param id
     * @return
     */
    @GetMapping("/img")
    @ResponseBody
    public ImgVO<List<Map<String,Object>>> listImgVO(@RequestParam(value = "id")Integer id){
        List<Map<String,Object>> list = new ArrayList<>();
        AppOpen appOpen = appOpenService.findOne(id);

        List<String> imgList =  SplitUtil.splitComme(appOpen.getImgUrl());
        for (int i = 0; i < imgList.size(); i++) {
            Map<String,Object> result = new HashMap<>();
            result.put("alt",i);
            result.put("pid",""+i);
            result.put("src",imgList.get(i));
            result.put("thumb",imgList.get(i));
            list.add(result);
        }
        return ImgVOUtil.success(1,list);
    }

    /**
     *
     * @param id
     * @param map
     * @return
     */
    @PostMapping("/description")
    @ResponseBody
    public ResultVO<Map<String,Object>> getAppDescription(@RequestParam(value = "id")Integer id,
                                                          Map<String,Object> map){
        map.put("appOpen",appOpenService.findOne(id));
        return ResultVOUtil.success(map);
    }

    /**
     *
     * @param id
     * @param map
     * @return
     */
    @PostMapping("/delete")
    @ResponseBody
    public ResultVO<Map<String,Object>> delete(@RequestParam(value = "id")Integer id,
                                               Map<String,Object> map){
        return  appOpenService.delete(id);
    }
}
