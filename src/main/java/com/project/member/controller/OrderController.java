package com.project.member.controller;

import com.project.member.dto.CartDTO;
import com.project.member.dto.OrderDTO;
import com.project.member.dto.ProductDTO;
import com.project.member.service.MemberService;
import com.project.member.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class OrderController {
    private final OrderService orderService;
    private final MemberService memberService;

    @GetMapping("/order.do")
    public String order(CartDTO cartDTO, OrderDTO orderDTO,
                        Model model, HttpServletRequest request){
        HttpSession Session = request.getSession();
        int m_idx = (int) Session.getAttribute("m_idx");
        cartDTO.setM_idx(m_idx);
        List<ProductDTO> productList = orderService.getProductInfo(m_idx);

        model.addAttribute("productList",productList);


        return "/order/orders";
    }


}
