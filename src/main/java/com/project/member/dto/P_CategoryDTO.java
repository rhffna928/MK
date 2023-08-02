package com.project.member.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class P_CategoryDTO {

    private String p_cate_idx;
    private String p_cate_name;
    private String p_cate_parent;
    private int p_cate_tier;
}
