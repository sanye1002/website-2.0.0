package com.rysj.controller.oa;

import com.rysj.VO.ImgVO;
import com.rysj.VO.ResultVO;


import com.rysj.dataobject.VideoMake;
import com.rysj.form.VideoMakeForm;
import com.rysj.service.VideoMakeService;
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
 * @Desc 影视制作添加后台
 */
@Controller
@Slf4j
@RequestMapping("/oa/videoMake")
public class VideoMakeController {

    @Autowired
    private VideoMakeService videoMakeService;

    @GetMapping("/index")
    public ModelAndView index(Map<String,Object> map,
                              @RequestParam(value = "id",defaultValue = "0")Integer id){
        VideoMake videoMake = new VideoMake();
        if (id != 0){
            videoMake = videoMakeService.findOne(id);
        }
        map.put("pageId",23);
        map.put("videoMake",videoMake);
        return new ModelAndView("oa/view/videoMakeAdd",map);
    }


    /**
     * 
     * @param map
     * @param id
     * @param videoMakeForm
     * @param bindingResult
     * @return
     */
    @PostMapping("/save")
    @ResponseBody
    public ResultVO<Map<String,Object>> save(Map<String,Object> map,
                                             @RequestParam(value = "id",defaultValue = "0")Integer id,
                                             @Valid VideoMakeForm videoMakeForm,
                                             BindingResult bindingResult){

        VideoMake videoMake = new VideoMake();
        if (id != 0){
            videoMake = videoMakeService.findOne(id);
        }
        BeanUtils.copyProperties(videoMakeForm,videoMake);
        return videoMakeService.save(videoMake);

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
        Page<VideoMake> videoMakes = videoMakeService.findAllByContentShow(pageable,1);
        map.put("pageId", 24);
        map.put("pageContent", videoMakes);
        map.put("url", "/oa/videoMake/list");
        map.put("size", size);
        map.put("currentPage", page);
        return new ModelAndView("oa/view/videoMakeList",map);
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
        VideoMake videoMake = videoMakeService.findOne(id);
        List<String> stringList =  SplitUtil.splitComme(videoMake.getImgUrl());
        for (int i = 0; i < stringList.size(); i++) {
            Map<String,Object> map = new HashMap<>();
            map.put("alt",i);
            map.put("pid",""+i);
            map.put("src",stringList.get(i));
            map.put("thumb",stringList.get(i));
            list.add(map);
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
        map.put("videoMake",videoMakeService.findOne(id));
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
        return  videoMakeService.delete(id);
    }
}
