package com.project.member.controller;

import com.project.member.service.AjaxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController /*Spring 4.0 부터 지원 @Controller 와 @ResponseBody 기능*/
public class AjaxController {
    private AjaxService ajaxService;

    @Autowired //자동 의존 주입: 생성자 방식
    public AjaxController(AjaxService ajaxService) {
        this.ajaxService = ajaxService;
    }

    @PostMapping("/searchIdProcess.do")
    public String searchIdProcess(@RequestParam("m_email") String m_email,Model model){

        String result = ajaxService.searchid(m_email);
        System.out.println("아이디는"+result);
        return result;
    }

}
