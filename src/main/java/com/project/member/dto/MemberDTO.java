package com.project.member.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class MemberDTO {
    private int m_idx;
    private String m_id;
    private String m_pw;
    private String m_email;
    private String m_tel;
    private int m_grade;
    private String m_tier;
    private String m_gender;
    private int m_jumin;
    private Date m_writeday;
    private String m_ip;
    private String delyn;

    public String toString(){
        return "MemberDTO [m_id="+m_id+",m_pw"+m_pw+",m_email="+m_email+",m_tel="+m_tel+"m_grade="+m_grade+",m_tier="+m_tier+
                ",m_gender="+m_gender+",m_jumin="+m_jumin+",m_writeday="+m_writeday
                +",m_ip="+m_ip+",delyn="+delyn+"]";
    }

}