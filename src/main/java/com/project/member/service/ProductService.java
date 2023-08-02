package com.project.member.service;

import com.project.member.dto.ProductDTO;
import com.project.member.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;
    public int productadd(Map<String, String> param) {
        return productRepository.productadd(param);
    }

    public List<ProductDTO> getProductList() {
        return productRepository.getProductList();
    }
}