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
}
