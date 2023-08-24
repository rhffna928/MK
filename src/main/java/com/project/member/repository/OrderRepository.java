package com.project.member.repository;

import com.project.member.dto.DetailDTO;
import com.project.member.dto.OrderDTO;
import com.project.member.dto.OrderListDTO;
import com.project.member.dto.ProductDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class OrderRepository {
    private final SqlSessionTemplate sql;


    public List<ProductDTO> getProductInfo(int m_idx) {
        return sql.selectList("Order.productInfo",m_idx);
    }

    public int getorderdlt(OrderDTO orderDTO) {
        return sql.delete("Cart.orderdlt",orderDTO);
    }

    public int getupdatepcnt(OrderDTO orderDTO) {
        return sql.update("Product.p_Cnt",orderDTO);
    }

    public int getinsertorder(OrderDTO orderDTO) {
        return sql.insert("Order.orderInfo",orderDTO);
    }

    public int getinterdetail(DetailDTO detailDTO) {
        return sql.insert("Order.detailsInfo",detailDTO);
    }

    public HashMap<String, Object> getTotalPrice(int m_idx, int c_idx) {
        HashMap<String, Object> pay = new HashMap<String, Object>();
        pay.put("m_idx",m_idx);
        pay.put("p_idx", c_idx);
        return sql.selectOne("Order.totalPrice",pay);
    }

}
