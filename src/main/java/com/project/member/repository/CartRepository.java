package com.project.member.repository;

import com.project.member.dto.CartDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class CartRepository {

    private final SqlSessionTemplate sql;

    public List<CartDTO> getcartList(CartDTO cartDTO){
        return sql.selectList("Cart.cartList",cartDTO);
    }

    public int check(CartDTO cartDTO) {
        return sql.selectOne("Cart.check", cartDTO);
    }

    public int cartAdd(CartDTO cartDTO) {
        return sql.insert("Cart.cartAdd",cartDTO);
    }

    public int cartPlus(CartDTO cartDTO) {
        return sql.update("Cart.cartPlus",cartDTO);
    }

    public CartDTO getCartCnt(int m_idx) {
        return sql.selectOne("Cart.cartCnt",m_idx);
    }

    public int getCartUpdate(CartDTO cartDTO) {
        return sql.update("Cart.update",cartDTO);
    }

    public int getCartDelete(CartDTO cartDTO) {
        return sql.delete("Cart.delete",cartDTO);
    }

    public HashMap<String, Object> getProductPrice(int m_idx) {
        return sql.selectOne("Cart.productPrice",m_idx);
    }
}
