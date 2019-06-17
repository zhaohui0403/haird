package com.controller;

import com.bean.HairdCard;
import com.google.gson.Gson;
import com.model.Page;
import com.service.HairdCardService;
import com.sun.xml.internal.ws.resources.HttpserverMessages;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by ADMIN on 2019/6/10.
 */
@Controller
public class HairdCardController {
    Logger logger = LoggerFactory.getLogger(HairdCardController.class);

    @Autowired
    private HairdCardService hairdCardService;

    @RequestMapping("/hairdCard")
    public String getCards(HttpServletRequest request, Model model,HairdCard hairdCard){
        long startTime = new Date().getTime();
        Page<HairdCard> cards = hairdCardService.getCards(hairdCard);
        model.addAttribute("cardList",cards);
        model.addAttribute("hairdCard",hairdCard);
        long endTime = new Date().getTime();
        logger.info("剪发卡列表查询用时：" + (endTime-startTime));
        return "hairdCard/hairdCard";
    }

    @RequestMapping("/addCard")
    @ResponseBody
    public String addCard(HttpServletRequest request, Model model,HairdCard hairdCard){
        long startTime = new Date().getTime();
        String cardId = hairdCardService.card(hairdCard);
        long endTime = new Date().getTime();
        logger.info("办卡用时：" + (endTime-startTime));
        return cardId;
    }

    @RequestMapping("/getCard")
    public String card(HttpServletRequest request,Model model,int id){
        HairdCard card = hairdCardService.getCardById(id);
        model.addAttribute("hairdCard",card);
        return "hairdCard/card";
    }

    @RequestMapping("/updateCard")
    @ResponseBody
    public void updateCard(HttpServletRequest request,Model model,HairdCard hairdCard){
        hairdCardService.update(hairdCard);
    }

    @RequestMapping("/card")
    public String getCard(){
        return "hairdCard/card";
    }
}
