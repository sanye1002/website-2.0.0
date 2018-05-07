package com.rysj.controller.oa;

import com.rysj.VO.ResultVO;
import com.rysj.dataobject.AnchorRegister;
import com.rysj.service.AnchorRegisterService;
import com.rysj.utils.ResultVOUtil;
import com.rysj.utils.SortTools;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-08 上午 11:45
 */
@Controller
@Slf4j
@RequestMapping("/oa/register")
public class RegisterController {

    @Autowired
    private AnchorRegisterService service;

    @GetMapping("/list")
    public ModelAndView list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                             @RequestParam(value = "size", defaultValue = "10") Integer size,
                             Map<String, Object> map) {
        PageRequest request = new PageRequest(page-1,size, SortTools.basicSort());
        Page<AnchorRegister> anchorRegisterPage = service.findAll(request);
        map.put("pageId", 8);
        map.put("pageContent", anchorRegisterPage);
        map.put("url", "/oa/register/list");
        map.put("size", size);
        map.put("currentPage", page);
        return new ModelAndView("oa/view/registerList",map);
    }

    @PostMapping("/delete")
    @ResponseBody
    public ResultVO<Map<String,Object>> delete(@RequestParam(value = "id") Integer id){
        if (id == null){
            return ResultVOUtil.error(100,"Id不能为空");
        }
        service.delete(id);
        return ResultVOUtil.success();
    }
}
