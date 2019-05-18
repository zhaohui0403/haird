package com.controller;

import com.bean.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2019/4/3.
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/submit")
    public String test(Model model,HttpServletRequest request, HttpServletResponse response, User user) throws Exception{
        User bean = userService.getUserByUsername(user.getUsername());
        if(bean == null){
            model.addAttribute("status","0");
            model.addAttribute("msg","不存在该用户！");
            return "login";
        }else if (!bean.getPassword().equals(user.getPassword()) ){
            model.addAttribute("status",0);
            model.addAttribute("msg","密码错误！");
            return "login";
        }
        HttpSession session = request.getSession();
        session.setAttribute("user",user);
        return "redirect:main";
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response) throws Exception{
        return "login";
    }
}
