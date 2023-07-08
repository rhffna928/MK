package com.project.member.repository;

import com.project.member.dto.MemberDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class AdminRepository {

    private final SqlSessionTemplate sql;
    public static final String MAPPER = "com.project.member.admin";

    public List<MemberDTO> memberList() {
        return sql.selectList("Admin.m_list");
    }

    public int updateInfo(HashMap<String,  Integer> map) {
        System.out.println(map);
        return sql.update("Admin.updateInfo", map);

    }

    public int deleteInfo(List<Integer> m_idx_list) {
        return sql.delete("Admin.deleteInfo",m_idx_list);
    }
}
