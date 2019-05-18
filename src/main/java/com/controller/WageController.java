package com.controller;

import com.bean.Custom;
import com.bean.Wage;
import com.service.CustomService;
import com.service.WageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by Administrator on 2019/4/20.
 */
@Controller
public class WageController {
    @Autowired
    private CustomService customService;
    @Autowired
    private WageService wageService;

    @RequestMapping("wage")
    public String wage(Model model, Wage wage){
        List<Custom> custom = customService.getCustom(new Custom());

        List<Wage> wages = wageService.getWages(wage);

        model.addAttribute("custom",custom);
        model.addAttribute("wages",wages);
        model.addAttribute("wage",wage);
        return "wage/wage";
    }

    @RequestMapping("detail")
    public String detail(Model model, Wage wage){
        List<Wage> wages = wageService.detail(wage);
        model.addAttribute("wages",wages);
        return "wage/wageDetail";
    }
}
