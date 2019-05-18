package com.controller;

import com.bean.Custom;
import com.bean.Recharge;
import com.service.CustomService;
import com.service.RechargeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Administrator on 2019/4/8.
 */
@Controller
public class RechargeController {
    @Autowired
    private CustomService customService;
    @Autowired
    private RechargeService rechargeService;

    @RequestMapping("recharge")
    public String payLogList(Model model,String cardId){
        List<Custom> custom = customService.getCustom(new Custom());
        model.addAttribute("custom",custom);
        model.addAttribute("cardId",cardId);
        return "recharge/recharge";
    }

    @RequestMapping("charge")
    @ResponseBody
    public String charge(Model model, Recharge recharge){
        String charge = rechargeService.charge(recharge);
        return charge;
    }

    @RequestMapping("payLog")
    public String payLog(Model model,Integer memberId){
        List<Recharge> logs = rechargeService.getLogs(memberId);
        model.addAttribute("payLogs",logs);
        return "recharge/paylog";
    }
}
