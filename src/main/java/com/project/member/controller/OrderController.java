package com.project.member.controller;

import com.project.member.dto.OrderDTO;
import com.project.member.service.OrderService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class OrderController {
    private final OrderService orderService;

    @GetMapping("/order.do")
    public String order(@RequestParam Map<String, String> param, OrderDTO orderDTO,
                        Model model, HttpServletRequest request){
        String c_idxArr = param.get("c_idxArr");
        System.out.println(c_idxArr);
        List<OrderDTO> orderslist = new ArrayList<>();
        model.addAttribute("order", orderslist);

        HttpSession Session = request.getSession();
        int m_idx = (int) Session.getAttribute("m_idx");

        orderDTO.setM_idx(m_idx);
        return "/order/orders";
    }


}
