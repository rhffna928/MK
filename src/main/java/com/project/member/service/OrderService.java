package com.project.member.service;

import com.project.member.dto.ProductDTO;
import com.project.member.repository.OrderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderService {

    private final OrderRepository orderRepository;


    public List<ProductDTO> getProductInfo(int m_idx) {
        return orderRepository.getProductInfo(m_idx);
    }
}
