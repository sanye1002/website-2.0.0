package com.rysj.controller.rysj;

import com.rysj.VO.ProductVO;
import com.rysj.VO.ResultVO;
import com.rysj.dataobject.TeamInfo;
import com.rysj.form.ProductRegisterFrom;
import com.rysj.service.AppOpenService;
import com.rysj.service.ProductRegisterService;
import com.rysj.service.TeamInfoService;
import com.rysj.service.VideoMakeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import javax.websocket.server.PathParam;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-08 上午 9:24
 */
@Controller
@Slf4j
@RequestMapping("/rysj/product")
public class ProductPageController {
    @Autowired
    private AppOpenService appOpenService;

    @Autowired
    private VideoMakeService videoMakeService;

    @Autowired
    private ProductRegisterService registerService;

    @GetMapping("/info")
    public ModelAndView info(Map<String, Object> map, @RequestParam("type") String type) {
        List<ProductVO> list = new ArrayList<>();
        if (type.equals("video")) {
            list = videoMakeService.findAll2ProductVO(1);
            map.put("list", list);
            map.put("type", type);
            map.put("title","影视制作");
            map.put("keywords","影视制作");
            map.put("description", "月步科技,文化传媒管理系统，传媒公司官网");
            return new ModelAndView("rysj/view/productInfo");
        }
        list = appOpenService.findAll2ProductVO(1);
        map.put("list", list);
        map.put("type", type);
        map.put("title","软件中心");
        map.put("keywords","软件中心");
        map.put("description", "月步科技,文化传媒管理系统，传媒公司官网");
        return new ModelAndView("rysj/view/productInfo");
    }

    @GetMapping("/register")
    public ModelAndView registerModel() {
        return new ModelAndView("rysj/component/productRegister");
    }

    @PostMapping("/save")
    @ResponseBody
    public ResultVO<Map<String, Object>> tiJiao(@Valid ProductRegisterFrom productRegisterFrom,
                                                BindingResult bindingResul) {
    return registerService.save(productRegisterFrom);
    }
}
