package com.project.member.repository;

import com.project.member.dto.ProductDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class ProductRepository {
    private final SqlSessionTemplate sql;
    public int productadd(ProductDTO productDTO) {
        return sql.insert("Product.add",productDTO);
    }

    public List<ProductDTO> getProductList() {
        return sql.selectList("Product.p_list");
    }
    public List<ProductDTO> getProductModi() {
        return sql.selectOne("Product.productModi");
    }
}