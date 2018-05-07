package com.rysj.controller.rysj;

import com.rysj.dataobject.AnchorInfo;
import com.rysj.service.AnchorInfoService;
import com.rysj.utils.SortTools;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-26 下午 3:27
 */
@Controller
@RequestMapping("/rysj/anchor")
@Slf4j
public class AnchorInfoPageController {

    @Autowired
    private AnchorInfoService service;


    @GetMapping("/list")
    public ModelAndView list(@RequestParam(value = "page",defaultValue = "1") Integer page,
                             @RequestParam(value = "size",defaultValue = "9") Integer size,
                             Map<String,Object> map){
        PageRequest request = new PageRequest(page-1,size, SortTools.basicSort());
        Page<AnchorInfo> infoPage = service.findList(request);
        map.put("pageContent",infoPage);
        map.put("size",size);
        map.put("currentPage",page);
        map.put("url","/rysj/anchor/list");
        return new ModelAndView("rysj/view/anchorInfoList",map);

    }
    @GetMapping("/detail")
    public ModelAndView detail(@Param(value = "id") Integer id,
                               Map<String,Object> map){
        PageRequest pageRequest = new PageRequest(0,6);
        Page<AnchorInfo> anchorInfoPage = service.findList(pageRequest);

        map.put("anchorInfoList",anchorInfoPage.getContent());
        log.info("id={}",id);
        AnchorInfo anchorInfo = service.findOne(id);
        map.put("anchorInfo",anchorInfo);
        return new ModelAndView("rysj/view/anchorInfo",map);
    }
}
