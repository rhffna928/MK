package com.project.member.controller;

import com.project.member.dto.CartDTO;
import com.project.member.dto.DetailDTO;
import com.project.member.dto.OrderDTO;
import com.project.member.dto.ProductDTO;
import com.project.member.service.CartService;
import com.project.member.service.MemberService;
import com.project.member.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class OrderController {
    private final OrderService orderService;
    private final MemberService memberService;
    private final CartService cartService;

    @GetMapping("/order.do")
    public String order(@RequestParam(value = "c_idxArr") List<String> c_idxArr, CartDTO cartDTO, OrderDTO orderDTO,
                        Model model, HttpServletRequest request){
        HttpSession Session = request.getSession();
        int m_idx = (int) Session.getAttribute("m_idx");
        cartDTO.setM_idx(m_idx);
        List<ProductDTO> productList = orderService.getProductInfo(m_idx);
        HashMap<String, Object> productPrice = cartService.getProductPrice(m_idx);
        model.addAttribute("productList",productList);
        model.addAttribute("productPrice", productPrice);

        System.out.println(c_idxArr);
        return "/order/orders";
    }
    @PostMapping("/orderInsert.do")
    public String orderInsert(OrderDTO orderDTO, DetailDTO detailDTO, HttpServletRequest request) {

        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
        String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
        String subNum = "";

        for(int i = 1; i <= 6; i ++) {
            subNum += (int)(Math.random() * 10);
        }

        String o_idx = ymd + "_" + subNum;
        orderDTO.setO_idx(o_idx);
        detailDTO.setO_idx(o_idx);
        orderService.getupdatepcnt(orderDTO);
        orderService.getorderdlt(orderDTO);
        orderService.getinsertorder(orderDTO);
        orderService.getinsertdetail(detailDTO);
        System.out.println("주문 : "+orderDTO);
        System.out.println("주문디테일 : "+detailDTO);
        return "redirect:/index.do";
    }


}
