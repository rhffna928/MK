package com.project.member.controller;

import com.project.member.service.AjaxService;
import org.springframework.beans.factory.annotation.Autowired;
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

    @PostMapping("/searchId")
    public String searchId(@RequestParam("m_email") String m_email){

        String result = ajaxService.searchId(m_email);
        System.out.println("아이디는"+m_email);
        return "searchId";
    }

}
