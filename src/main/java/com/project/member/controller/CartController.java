package com.project.member.controller;

import com.project.member.dto.CartDTO;
import com.project.member.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class CartController {

    private final CartService cartService;

    @GetMapping("/cartAdd.do")
    public String cartAdd(@ModelAttribute CartDTO cartDTO, HttpSession session){
        int m_idx = (int) session.getAttribute("m_idx");
        cartDTO.setM_idx(m_idx);

        int check = cartService.check(cartDTO);

        if(check == 0){
            cartService.cartAdd(cartDTO);
        } else{
            cartService.cartPlus(cartDTO);
        }
        System.out.println(cartDTO);
        return "redirect:/cartList.do";
    }
    @GetMapping("/cartList.do")
    public String cartList(@ModelAttribute CartDTO cartDTO,Model model){

        List<CartDTO> cartlist = cartService.getCartList(cartDTO);

        model.addAttribute("cartlist" + cartlist);
        System.out.println(cartDTO);

        return "/cart/cartList";
    }
}
