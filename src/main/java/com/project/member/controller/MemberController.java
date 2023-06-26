package com.project.member.controller;

import com.mysql.cj.protocol.x.Notice;
import com.project.member.dto.MemberDTO;
import com.project.member.repository.MemberRepository;
import com.project.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
    private  final MemberService memberService;

    @GetMapping("/save")
    public String saveForm(){
        return "save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO){
        int saveResult = memberService.save(memberDTO);
        if(saveResult > 0){
            return "login";
        }else{
            return "save";
        }
    }
    @GetMapping("/login")
    public String loginForm(){
        return "login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpServletRequest request
                        ) throws NoSuchAlgorithmException {
        boolean loginResult = memberService.login(memberDTO);

        String viewPage;
        if (loginResult) {
            HttpSession session = request.getSession();
            session.setAttribute("m_id",memberDTO.getM_id());
            session.setAttribute("m_pw",memberDTO.getM_pw());
            viewPage = "redirect:index";
        } else {
            viewPage = "login";
        }
        return viewPage;
        }
    @GetMapping("/searchId")
    public String searchIdForm(){
        return "searchId";
    }


}
