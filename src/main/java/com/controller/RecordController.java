package com.controller;

import com.bean.Custom;
import com.bean.Record;
import com.google.gson.Gson;
import com.model.Page;
import com.service.CustomService;
import com.service.RecordService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by Administrator on 2019/4/16.
 */
@Controller
public class RecordController {
    Logger logger = LoggerFactory.getLogger(RecordController.class);

    @Autowired
    private RecordService recordService;
    @Autowired
    private CustomService customService;

    @RequestMapping("record")
    public String record(Model model, Record record){
        Page<Record> page = recordService.getRecords(record);
        model.addAttribute("page",page);
        model.addAttribute("record",record);
        List<Custom> hair  = customService.getCustomByType("1");
        List<Custom> assi  = customService.getCustomByType("2");
        model.addAttribute("custom1",hair);
        model.addAttribute("custom2",assi);
        return "record/record";
    }

    @RequestMapping("bill")
    public String bill(Model model){
        List<Custom> hair  = customService.getCustomByType("1");
        List<Custom> assi  = customService.getCustomByType("2");
        model.addAttribute("custom1",hair);
        model.addAttribute("custom2",assi);
        return "record/bill";
    }

    @RequestMapping("commit")
    public String commit(Model model,Record record){
        logger.info("请求信息："+ new Gson().toJson(record));
        recordService.bill(record);
        return "redirect:record";
    }

    @RequestMapping("delRecord")
    public String delRecord(Integer id){
        logger.info("删除消费单：" + id);
        recordService.del(id);
        return "redirect:record";
    }

}
