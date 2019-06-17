package com.controller;

import com.bean.*;
import com.service.CustomService;
import com.service.CutLogService;
import com.service.HairdCardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by ADMIN on 2019/6/15.
 */
@Controller
public class CutLogController {
    Logger logger = LoggerFactory.getLogger(CutLogController.class);

    @Autowired
    private CustomService customService;
    @Autowired
    private HairdCardService hairdCardService;
    @Autowired
    private CutLogService cutLogService;

    @RequestMapping("/cut")
    public String cut(HttpServletRequest request, Model model,int id){

        HairdCard hairdCard = hairdCardService.getCardById(id);

        List<Custom> hair  = customService.getCustomByType("1");
        List<Custom> assi  = customService.getCustomByType("2");
        model.addAttribute("custom1",hair);
        model.addAttribute("custom2",assi);
        model.addAttribute("cardId",hairdCard.getCardId());
        model.addAttribute("amout", Integer.parseInt(hairdCard.getAmout())/ hairdCard.getTimes());
        return "cut/cut";
    }

    @RequestMapping("save")
    @ResponseBody
    public void save(HttpServletRequest request, CutLog cutLog, Record record){
        cutLogService.cut(cutLog,record);
    }

    @RequestMapping("cutLog")
    public String cutLog(HttpServletRequest request,Model model,int id){
        List<CutLog> cutLogs = cutLogService.cutLogs(id);
        model.addAttribute("cutlogs",cutLogs);
        return "cut/cutlog";
    }

}
