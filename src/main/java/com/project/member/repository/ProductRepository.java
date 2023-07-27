package com.project.member.repository;

import com.project.member.dto.ProductDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class ProductRepository {
    private final SqlSessionTemplate sql;
    public int productadd(ProductDTO productDTO) {
        return sql.insert("Product.add",productDTO);
    }
}