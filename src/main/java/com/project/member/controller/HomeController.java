package com.project.member.controller;

import com.project.member.dto.CartDTO;
import com.project.member.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final CartService cartService;
    @GetMapping("/")
    public String index1(){
        return "index"; // => index.jsp 출력
    }

    @GetMapping("/index.do")
    public String index2(Model model, HttpServletRequest request, HttpSession session){

        HttpSession Session = request.getSession();
        int m_idx = (int) Session.getAttribute("m_idx");
        CartDTO cartDTO = new CartDTO();
        cartDTO.setM_idx(m_idx);

        CartDTO cartCnt = cartService.getCartCnt(m_idx);
        model.addAttribute("cartCnt",cartCnt);

        return "index"; // => index.jsp 출력
    }
}