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
    public int productadd(Map<String, String> param) {
        return sql.insert("Product.add",param);
    }

    public List<ProductDTO> getProductList() {
        return sql.selectList("Product.p_list");
    }
}