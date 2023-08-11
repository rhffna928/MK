package com.project.member.controller;

import com.project.member.dto.MemberDTO;
import com.project.member.service.EncryptPwd;
import com.project.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;

@Controller
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;

    @GetMapping("/save.do")
    public String saveForm(){
        return "/member/save";
    }

    @PostMapping("/saveProcess.do")
    public String saveProcess(@ModelAttribute MemberDTO memberDTO) throws NoSuchAlgorithmException {

        String pwd = memberDTO.getM_pw();
        EncryptPwd encryptPwd = new EncryptPwd(pwd);
        pwd = encryptPwd.getPwd();
        memberDTO.setM_pw(pwd);

        int saveResult = memberService.save(memberDTO);

        if(saveResult > 0){
            return "member/login";
        }else{
            return "/member/save";
        }
    }

    @GetMapping("/login.do")
    public String loginForm(){
        return "/member/login";
    }

    /*로그인*/
    @PostMapping("/login.do")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpServletRequest request,
                        Model model) throws NoSuchAlgorithmException {

        EncryptPwd encryptPwd = new EncryptPwd(memberDTO.getM_pw());
        memberDTO.setM_pw(encryptPwd.getPwd());

        MemberDTO loginResult = memberService.login(memberDTO);
        HttpSession session = request.getSession();

        String viewPage;

        if (loginResult != null) {
            session.setAttribute("member",loginResult);
            session.setAttribute("m_idx",loginResult.getM_idx());
            session.setAttribute("m_grade",loginResult.getM_grade());

            viewPage = "redirect:/index.do";
        } else {
            viewPage = "/member/login";
        }
        System.out.println(loginResult);
        return viewPage;
    }


    @GetMapping("/logout.do")
    public String logout(HttpServletRequest request) {
        HttpSession Session = request.getSession();
        Session.invalidate();

        return "redirect:/index";
    }
    @GetMapping("/searchId.do")
    public String searchIdForm(){
        return "/member/searchId";
    }

    @GetMapping("/searchPw.do")
    public String searchPwForm(){
        return "/member/searchPw";
    }








}
