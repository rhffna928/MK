package com.project.member.repository;

import com.project.member.dto.ProductDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class OrderRepository {
    private final SqlSessionTemplate sql;


    public List<ProductDTO> getProductInfo(int m_idx) {
        return sql.selectList("Order.productInfo",m_idx);
    }
}
