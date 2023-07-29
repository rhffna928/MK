package com.project.member.service;

import com.project.member.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;
    public int productadd(Map<String, String> param) {
        return productRepository.productadd(param);
    }
}