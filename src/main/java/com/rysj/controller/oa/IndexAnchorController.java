package com.rysj.controller.oa;

import com.rysj.VO.ResultVO;
import com.rysj.dataobject.AnchorInfo;
import com.rysj.service.AnchorInfoService;
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
 * @create 2018-04-08 下午 4:33
 */
@Controller
@RequestMapping("/oa/index")
@Slf4j
public class IndexAnchorController {

    @Autowired
    private AnchorInfoService anchorInfoService;

    @GetMapping("/anchor")
    public ModelAndView indexList(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                  @RequestParam(value = "size", defaultValue = "10") Integer size,
                                  Map<String, Object> map) {

        PageRequest request = new PageRequest(page - 1, size, SortTools.basicSort());
        Page<AnchorInfo> infoPage = anchorInfoService.findList(request);
        map.put("pageId", 6);
        map.put("pageContent", infoPage);
        map.put("url", "/oa/anchor/list");
        map.put("size", size);
        map.put("currentPage", page);
        return new ModelAndView("oa/view/indexAnchor", map);
    }

    @PostMapping("/changeShow")
    @ResponseBody
    public ResultVO<Map<String, Object>> changeShow(@RequestParam(value = "id") Integer id,
                                                     @RequestParam(value = "showStatus") Integer showStatus) {

        if (id == null) {
            return ResultVOUtil.error(100, "数据为空！");
        }
        if (showStatus == null) {
            return ResultVOUtil.error(100, "数据为空！");
        }
        AnchorInfo anchorInfo = new AnchorInfo();
        anchorInfo =  anchorInfoService.findOne(id);
        anchorInfo.setShowStatus(showStatus);
        anchorInfoService.save(anchorInfo);
        return ResultVOUtil.success();


    }
}
