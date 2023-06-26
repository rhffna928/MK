package com.project.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController {

    @GetMapping("/")
    public String index1(){
        return "index"; // => index.jsp 출력
    }

    @GetMapping("/index.do")
    public String index2(Model model, HttpServletRequest request){
        return "index"; // => index.jsp 출력
    }
}