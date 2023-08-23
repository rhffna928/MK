package com.project.member.service;

import com.project.member.dto.DetailDTO;
import com.project.member.dto.OrderDTO;
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

    public int getorderdlt(OrderDTO orderDTO) {
        return orderRepository.getorderdlt(orderDTO);
    }

    public int getupdatepcnt(OrderDTO orderDTO) {
        return orderRepository.getupdatepcnt(orderDTO);
    }

    public int getinsertorder(OrderDTO orderDTO) {
        return orderRepository.getinsertorder(orderDTO);
    }

    public int getinsertdetail(DetailDTO detailDTO) {
        return orderRepository.getinterdetail(detailDTO);
    }

    /*public void getinsertdetail(DetailDTO detailDTO) {
    }*/
}
