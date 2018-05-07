package com.rysj.controller.rysj;

import com.rysj.dataobject.ArticleInfo;
import com.rysj.service.ArticleInfoService;
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
 * @create 2018-03-26 下午 5:17
 */
@Controller
@RequestMapping("/rysj/article")
@Slf4j
public class ArticleInfoPageController {

    @Autowired
    private ArticleInfoService service;

    @GetMapping("/detail")
    public ModelAndView detail(@RequestParam(value = "id") Integer id,
                               Map<String, Object> map) {

        ArticleInfo articleInfo = service.findOne(id);
        articleInfo.setLookNumber(articleInfo.getLookNumber() + 2);
        service.save(articleInfo);
        PageRequest request = new PageRequest(0, 6);
        Page<ArticleInfo> articleInfoPage = service.findAll(request);
        map.put("articleList", articleInfoPage.getContent());
        map.put("type", articleInfo.getType());
        map.put("articleInfo", articleInfo);
        return new ModelAndView("rysj/view/articleInfo", map);
    }

    @GetMapping("/list")
    public ModelAndView list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                             @RequestParam(value = "size", defaultValue = "6") Integer size,
                             @RequestParam(value = "type") Integer type,
                             Map<String, Object> map) {
        PageRequest request = new PageRequest(page - 1, size,SortTools.basicSort());
        Page<ArticleInfo> articleInfoPage = null;
        if (type == 4) {
            articleInfoPage = service.findAll(request);
        }else {

            articleInfoPage = service.findAllByType(request, type);
        }

        map.put("pageContent", articleInfoPage);
        map.put("url", "/rysj/article/list");
        map.put("size", size);
        map.put("type", type);
        map.put("currentPage", page);
        return new ModelAndView("rysj/view/articleList", map);
    }
}
