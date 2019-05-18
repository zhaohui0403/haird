package com.controller;

import com.bean.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2019/4/5.
 */
@Controller
public class CommonController {
    @Autowired
    private UserService userService;
    @RequestMapping("/")
    public String index(){
        return "main";
    }
    @RequestMapping("/main")
    public String main(){
        return "main";
    }
    @RequestMapping("/left")
    public String left(){
        return "left";
    }
    @RequestMapping("/right")
    public String right(){
        return "right";
    }

    @ResponseBody
    @RequestMapping("/match")
    public boolean match(String password){
        System.out.println(password.toString());
        User user = userService.getUserByUsername("user");
        if(user.getPassword().equals(password)){
            return true;
        }else {
            return false;
        }
    }

    @RequestMapping("/report")
    public String report(){
        return "notsupport";
    }
    @RequestMapping("/rebate")
    public String rebate(){
        return "notsupport";
    }
}
