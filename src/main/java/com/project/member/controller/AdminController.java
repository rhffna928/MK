package com.project.member.controller;

import com.project.member.dto.Criteria;
import com.project.member.dto.MemberDTO;
import com.project.member.dto.OrderDTO;
import com.project.member.dto.PageMaker;
import com.project.member.service.AdminService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class AdminController {

    private final AdminService adminService;

    @GetMapping("/memberList.do")
    public String memberListForm(Model model, HttpServletRequest request){
        List<MemberDTO> memberDTO = adminService.memberlist();

        model.addAttribute("m_list",memberDTO);

        return "/admin/memberList";
    }
    @GetMapping("/orderList.do")
    public String orderList(@ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest request){
        List<OrderDTO> orderlist = adminService.orderlist();

        int total = adminService.getTotal(cri);
        PageMaker pageMake = new PageMaker(cri, total);

        model.addAttribute("o_list",orderlist);
        model.addAttribute("pageMaker", pageMake);

        return "/admin/orderList";
    }
}
