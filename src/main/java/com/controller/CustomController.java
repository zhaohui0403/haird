package com.controller;

import com.bean.Custom;
import com.service.CustomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by Administrator on 2019/4/5.
 */
@Controller
public class CustomController {
    @Autowired
    private CustomService customService;

    @RequestMapping("/custom")
    public String custom(Model model, Custom custom){
        List<Custom> customs = customService.getCustom(custom);
        model.addAttribute("customList",customs);
        return "custom/custom";
    }
    @RequestMapping("/customSign")
    public String sign(){
        return "custom/customSign";
    }
    @RequestMapping("/addCustom")
    public String addCustom(Model model,Custom custom){
        customService.addCustom(custom);
        return "redirect:custom";
    }
    @RequestMapping("/editCustom")
    public String editCustom(Model model,String id){
        Custom custom = customService.getCustomById(id);
        model.addAttribute("custom",custom);
        return "custom/customSign";
    }
    @RequestMapping("/updateCustom")
    public String update(Model model,Custom custom){
        customService.update(custom);
        return "redirect:custom";
    }
    @RequestMapping("/deleteCustom")
    public String delete(String id){
        customService.deleteById(id);
        return "redirect:custom";
    }
}
