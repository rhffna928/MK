package com.project.member.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class ProductDTO {

    private int p_idx;
    private String p_name;
    private int P_price;
    private int p_sale;
    private String p_img1;
    private String p_img2;
    private String p_img3;
    private String p_img4;
    private Date p_date;
    private int p_cnt;
    private String p_del;
    private String p_cate_idx;
    private String p_cate_name;
}