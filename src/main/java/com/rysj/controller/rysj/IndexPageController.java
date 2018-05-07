package com.rysj.controller.rysj;

import com.rysj.dataobject.AnchorInfo;
import com.rysj.dataobject.ArticleInfo;
import com.rysj.dataobject.IndexCarousel;
import com.rysj.repository.AnchorInfoRepository;
import com.rysj.repository.ArticleInfoRepository;
import com.rysj.repository.IndexCarouselRepository;
import com.rysj.service.AnchorInfoService;
import com.rysj.service.ArticleInfoService;
import com.rysj.service.IndexCarouselService;
import com.rysj.utils.SortTools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-26 上午 11:14
 */
@Controller
@RequestMapping("/")
public class IndexPageController {

    @Autowired
    private IndexCarouselService carouselService;
    @Autowired
    private AnchorInfoService anchorInfoService ;
    @Autowired
    private ArticleInfoService articleInfoService;
    @GetMapping("/")
    public ModelAndView index(Map<String,Object> map){
        List<IndexCarousel> carouselList = carouselService.findByShowStatus(1);
        map.put("carouselList",carouselList);
        //主播
        PageRequest pageRequest = new PageRequest(0,6,SortTools.basicSort());
        List<AnchorInfo> anchorInfoList = anchorInfoService.findAllByShowStatus(1);
        map.put("anchorInfoList",anchorInfoList);
        //type = 0
        Page<ArticleInfo> page0 = articleInfoService.findAllByType(pageRequest,0);
        Page<ArticleInfo> page1 = articleInfoService.findAllByType(pageRequest,1);
        Page<ArticleInfo> page2 = articleInfoService.findAllByType(pageRequest,2);
        map.put("page0",page0.getContent());
        map.put("page1",page1.getContent());
        map.put("page2",page2.getContent());
        return new ModelAndView("rysj/view/index",map);
    }
}
