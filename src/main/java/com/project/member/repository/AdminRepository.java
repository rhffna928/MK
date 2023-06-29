package com.project.member.repository;

import com.project.member.dto.MemberDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class AdminRepository {

    private final SqlSessionTemplate sql;
    public static final String MAPPER = "com.project.member.admin";

    public List<MemberDTO> memberList() {
        return sql.selectList("admin.m_list");
    }
}
