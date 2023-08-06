package com.project.member.service;

import com.project.member.dto.CartDTO;
import com.project.member.repository.CartRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CartService {
    private final CartRepository cartRepository;

    public List<CartDTO> getCartList(int m_idx){
        System.out.println("cartlist :"+ m_idx);
        return cartRepository.getcartList(m_idx);
    }

    public int check(CartDTO cartDTO) {
        System.out.println("check :"+ cartDTO);
        return cartRepository.check(cartDTO);
    }

    public int cartAdd(CartDTO cartDTO) {
        System.out.println("add :"+ cartDTO);
        return cartRepository.cartAdd(cartDTO);
    }

    public int cartPlus(CartDTO cartDTO) {
        System.out.println("plus :"+ cartDTO);
        return cartRepository.cartPlus(cartDTO);
    }
}
