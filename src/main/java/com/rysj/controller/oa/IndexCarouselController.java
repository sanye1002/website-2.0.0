package com.rysj.controller.oa;

import com.rysj.VO.ResultVO;
import com.rysj.dataobject.IndexCarousel;
import com.rysj.exception.WebException;
import com.rysj.form.IndexCarouselForm;
import com.rysj.service.IndexCarouselService;
import com.rysj.utils.ResultVOUtil;
import com.rysj.utils.SortTools;
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
 * Created by 超级战机
 * 2018-03-23 23:08
 */
@Controller
@Slf4j
@RequestMapping("/oa/carousel")
public class IndexCarouselController {

    @Autowired
    private IndexCarouselService service;

    @PostMapping("/save")
    @ResponseBody
    public ResultVO<Map<String, Object>> save(@Valid IndexCarouselForm carouselForm,
                                              BindingResult bindingResult) {
        Map<String, Object> map = new HashMap<>();
        if (bindingResult.hasErrors()) {
            log.info("【保存轮播图片】 失败信息={}", bindingResult.getFieldError().getDefaultMessage());
            return ResultVOUtil.error(100, bindingResult.getFieldError().getDefaultMessage());
        }
        IndexCarousel indexCarousel = new IndexCarousel();
        try {
            if (carouselForm.getId() != null) {
                indexCarousel = service.findOne(carouselForm.getId());
                indexCarousel.setShowStatus(carouselForm.getShowStatus());
                log.info("【保存轮播图片】 id={}",carouselForm.getId());
                if (carouselForm.getShowStatus() == 1) {
                    if (service.findByShowStatus(1).size() > 6) {
                        return ResultVOUtil.error(100, "首页图不能多于6张");
                    } else {
                        service.save(indexCarousel);
                        return ResultVOUtil.success(map);
                    }
                }else {
                    service.save(indexCarousel);
                    return ResultVOUtil.success(map);
                }
            } else {
                BeanUtils.copyProperties(carouselForm, indexCarousel);
                service.save(indexCarousel);
            }

        } catch (WebException e) {
            return ResultVOUtil.error(100, e.getMessage());
        }
        map.put("url", "/oa/carousel/index");
        return ResultVOUtil.success(map);
    }

    @GetMapping("/list")
    public ModelAndView list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                             @RequestParam(value = "size", defaultValue = "6") Integer size,
                             Map<String, Object> map) {
        PageRequest request = new PageRequest(page - 1, size, SortTools.basicSort());
        Page<IndexCarousel> carouselPage = service.findAll(request);
        map.put("pageId", 5);
        map.put("pageContent", carouselPage);
        log.info("size = {}",carouselPage.getContent().size());
        map.put("url", "/oa/carousel/list");
        map.put("size", size);
        map.put("currentPage", page);
        return new ModelAndView("oa/view/indexCarousel", map);
    }
}
