package com.rysj.controller.oa;

import com.rysj.VO.ResultVO;
import com.rysj.dataobject.ArticleInfo;
import com.rysj.exception.WebException;
import com.rysj.form.ArticleInfoForm;
import com.rysj.service.ArticleInfoService;
import com.rysj.utils.HTMLSpirit;
import com.rysj.utils.RandomUtils;
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
import java.awt.print.Pageable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-22 下午 6:08
 */
@Controller
@Slf4j
@RequestMapping("/oa/article")
public class ArticleInfoController {

    @Autowired
    private ArticleInfoService service;

    @GetMapping("/index")
    public ModelAndView index(Map<String,Object> map){
        map.put("pageId",3);
        return new ModelAndView("oa/view/articleAdd",map);
    }
    @PostMapping("/save")
    @ResponseBody
    public ResultVO<Map<String,Object>> save(@Valid ArticleInfoForm articleInfoForm,
                                             BindingResult bindingResult){
        Map<String,Object> map = new HashMap<>();
        if (bindingResult.hasErrors()){
            log.info("【保存文章】 失败信息={}",bindingResult.getFieldError().getDefaultMessage());
            return ResultVOUtil.error(100,bindingResult.getFieldError().getDefaultMessage());
        }
        ArticleInfo articleInfo = new ArticleInfo();
       try {
           if (articleInfoForm.getId()!=null){
               articleInfo = service.findOne(articleInfoForm.getId());
               if (articleInfoForm.getContent()==""||articleInfoForm.getContent()==null){
                    articleInfoForm.setContent(articleInfo.getContent());
               }
           }
           BeanUtils.copyProperties(articleInfoForm,articleInfo);
           if (articleInfoForm.getId()==null){
               articleInfo.setLookNumber(RandomUtils.getRandom());
               SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
               String date = dateFormat.format(new Date());
               articleInfo.setCreateTime(date);

           }
           if(HTMLSpirit.delHTMLTag(articleInfo.getContent()).length()<100){
               return ResultVOUtil.error(100,"内容少于100字！！！");
           }
           articleInfo.setInfo(HTMLSpirit.delHTMLTag(articleInfo.getContent()).substring(0,100));
           service.save(articleInfo);
       }catch (WebException w){
           return ResultVOUtil.error(100,w.getMessage());
       }
        map.put("url", "/oa/article/index");
        return ResultVOUtil.success(map);
    }

    @GetMapping("/list")
    public ModelAndView list(@RequestParam(value = "page",defaultValue = "1") Integer page,
                             @RequestParam(value = "size",defaultValue = "6") Integer size,
                             Map<String,Object> map){
        PageRequest request = new PageRequest(page-1,size,SortTools.basicSort());
        Page<ArticleInfo> articleInfoPage = service.findAll(request);
        map.put("pageId",4);
        map.put("pageContent",articleInfoPage);
        map.put("url","/oa/article/list");
        map.put("size",size);
        map.put("currentPage",page);
        return new ModelAndView("oa/view/articleList",map);
    }

    @PostMapping("/delete")
    @ResponseBody
    public ResultVO<Map<String,Object>> delete(@RequestParam("id") Integer id){
        service.delete(id);
        return ResultVOUtil.success();
    }

    @GetMapping("/detail")
    public ModelAndView detail(@RequestParam("id") Integer id,Map<String,Object> map){
        map.put("pageId",3);
        ArticleInfo articleInfo = service.findOne(id);
        map.put("article",articleInfo);
        return new ModelAndView("oa/view/articleDetail",map);
    }
}
