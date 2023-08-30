package com.project.member.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchCriteria {
    private String searchType;
    private String keyword;
    private String startday;
    private String endday;

    public SearchCriteria(){
        this.searchType = "";
        this.keyword = "";
    }
}
