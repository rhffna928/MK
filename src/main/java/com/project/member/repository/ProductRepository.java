package com.project.member.repository;

import com.project.member.dto.ProductDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ProductRepository {
    private final SqlSessionTemplate sql;
    public int productadd(ProductDTO productDTO) {
        return sql.insert("Product.add",productDTO);
    }

    public List<ProductDTO> getProductList() {
        return sql.selectList("Product.p_List");
    }

    public List<ProductDTO> getProductNewList() {
        return sql.selectList("Product.p_List");
    }
    public ProductDTO getProductView(int p_idx) {
        return sql.selectOne("Product.p_View",p_idx);
    }

    public int getProductModi(int p_idx) {
        return sql.update("Product.p_Modi",p_idx);
    }

    public int getcheckPn(String p_name) {
        return sql.selectOne("Product.checkPn",p_name);
    }
}