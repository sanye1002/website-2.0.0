package com.rysj.controller.oa;

import com.rysj.dataobject.ProductRegister;
import com.rysj.service.ProductRegisterService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * @Author zhaoxiang
 * @Date 2018/08/24
 * @Desc
 */
@Controller
@RequestMapping("/oa/product")
@Slf4j
public class ProductRegisterController {
    @Autowired
    private ProductRegisterService service;

    @GetMapping("/list")
    public ModelAndView list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                             @RequestParam(value = "size", defaultValue = "6") Integer size,
                             Map<String, Object> map){
        Pageable pageable = new PageRequest(page-1,size);
        Page<ProductRegister> productRegisterPage = service.findAllByPage(pageable);
        map.put("pageId", 25);
        map.put("pageContent", productRegisterPage);
        map.put("url", "/oa/product/list");
        map.put("size", size);
        map.put("currentPage", page);
        return new ModelAndView("oa/view/productRegisterList",map);
    }
}
