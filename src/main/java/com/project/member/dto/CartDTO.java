package com.project.member.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class CartDTO {

    private int c_idx;
    private int m_idx;
    private int p_idx;
    private int c_cnt;
    private String c_delyn;

    private int cnt;
    private String p_img1;
    private int p_sale;
    private int p_price;
    private String p_name;
    private int Point;
    private int salePrice;
    private int totalPrice;
    private int totalPoint;

    public void setInitPrice() {
        this.salePrice = (int)(Math.floor(this.p_price *(100 - this.p_sale)/100));
        this.totalPrice = this.p_price * this.c_cnt;
        this.Point = (int)(Math.floor(this.totalPrice * 0.05));
        this.totalPoint = this.Point * this.c_cnt;
    }
}
