package com.ssm.controller;


import com.ssm.model.User;
import com.ssm.tool.SensitiveWordsFilter;
import com.ssm.tool.Shuru;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {


    @RequestMapping("/login")
    public String login(User user, HttpServletRequest request){
        HttpSession session = request.getSession();
        String prePath = (String)session.getAttribute("preLink");
        prePath = replacePath(prePath);
        Shuru.shuruxinxi(request.getServletPath());
        user.setUserName(SensitiveWordsFilter.replace(user.getUserName()));
        session.setAttribute("userName",user.getUserName());
        session.setAttribute("userEmail",user.getUserEmail());
        return "redirect:"+prePath;
    }

    @RequestMapping("/cancellation")
    public void cancellation(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("userName");
        session.removeAttribute("userEmail");
    }

    private String replacePath(String path){
        if(path==null){
            return path="/shouye";
        }
        if(path.equals("/resources_download")){
            path = "/resources";
        } else if(path.contains("good")){
            String[] s = path.split("/");
            path = "/article/details/"+s[3];
        } else {
            path = "/shouye";
        }
        return path;
    }
}
