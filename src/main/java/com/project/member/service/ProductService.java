package com.project.member.service;

import com.project.member.dto.ProductDTO;
import com.project.member.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;
    public int productadd(ProductDTO productDTO) {
        return productRepository.productadd(productDTO);
    }
}