package com.rysj.controller.rysj;

import com.rysj.VO.ResultVO;
import com.rysj.dataobject.AnchorRegister;
import com.rysj.form.AnchorForm;
import com.rysj.service.AnchorRegisterService;
import com.rysj.utils.ResultVOUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-04-08 上午 10:25
 */
@Controller
@RequestMapping("/register")
@Slf4j
public class AnchorRegisterController {

    @Autowired
    private AnchorRegisterService service;

    @PostMapping("/anchor")
    @ResponseBody
    public ResultVO<Map<String,Object>> registerAnchor(@Valid AnchorForm anchorForm,
                                                       BindingResult bindingResult){
        Map<String, Object> map = new HashMap<>();
        if (bindingResult.hasErrors()) {
            map.put("message", bindingResult.getFieldError().getDefaultMessage());
            //调到错误页面
            log.info("【保存艺人】 error_message = {}", map.get("message"));
            return ResultVOUtil.error(100, bindingResult.getFieldError().getDefaultMessage());
        }
        AnchorRegister anchorRegister = new AnchorRegister();
        BeanUtils.copyProperties(anchorForm,anchorRegister);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String date = dateFormat.format(new Date());
        anchorRegister.setCreateTime(date);
        service.save(anchorRegister);
        return ResultVOUtil.success();
    }

}
