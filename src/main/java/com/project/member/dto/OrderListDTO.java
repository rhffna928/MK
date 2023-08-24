package com.project.member.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class OrderListDTO {

    private int d_idx;
    private String o_idx;
    private int m_idx;
    private String o_rec;
    private String m_addr1;
    private String m_addr2;
    private String m_addr3;
    private String o_tel;
    private int o_totalprice;
    private Date o_date;
    private int c_cnt;
    private int totalprice;
    private int p_idx;
    private int p_cnt;
    private int c_idx;
    private int p_sale;
    private String p_img1;
    private String p_img2;
    private String p_name;
}
