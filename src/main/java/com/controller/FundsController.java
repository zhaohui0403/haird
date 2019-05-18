package com.controller;

import com.bean.Funds;
import com.service.FundsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Administrator on 2019/4/14.
 */
@Controller
public class FundsController {
    @Autowired
    private FundsService fundsService;

    @RequestMapping("funds")
    public String funds(Model model, Funds funds){
        List<Funds> inComeFunds = fundsService.getInComeFunds(funds);
        List<Funds> expendFunds = fundsService.getExpendFunds(funds);
        String inComeAmout = fundsService.getInComeAmout(funds);
        String expendAmout = fundsService.getExpendAmout(funds) ;
        model.addAttribute("inComeFunds",inComeFunds);
        model.addAttribute("expendFunds",expendFunds);
        model.addAttribute("inComeAmout",inComeAmout);
        model.addAttribute("expendAmout",expendAmout);
        return "funds/funds";
    }

    @RequestMapping("/fundSign")
    public String fundSign(){
        return "funds/fundSign";
    }

    @ResponseBody
    @RequestMapping("saveFunds")
    public void saveFunds(Funds funds){
        //保存开支
        fundsService.addFunds(funds);
    }
}
