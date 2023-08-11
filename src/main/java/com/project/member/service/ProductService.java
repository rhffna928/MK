package com.project.member.service;

import com.project.member.dto.ProductDTO;
import com.project.member.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;
    public int productadd(ProductDTO productDTO) {
        System.out.println("상품등록"+productDTO);
        return productRepository.productadd(productDTO);
    }

    public List<ProductDTO> getProductList() {
        return productRepository.getProductList();
    }

    public ProductDTO getProductView(int p_idx) {
        return productRepository.getProductView(p_idx);
    }

    public int getProductModi(int p_idx) {
        return productRepository.getProductModi(p_idx);
    }
}