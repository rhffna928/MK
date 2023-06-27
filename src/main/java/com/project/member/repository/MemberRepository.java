package com.project.member.repository;
import lombok.RequiredArgsConstructor;
import com.project.member.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository
@RequiredArgsConstructor
public class MemberRepository {

    private final SqlSessionTemplate sql;

    public int save(MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO );

        return sql.insert("Member.save",memberDTO);
    }

    public HashMap<String,Long> login(HashMap<String,String> logininfo) {
        HashMap<String,Long> resultMap = sql.selectOne("Member.login",logininfo);
        if(resultMap.get("m_idx") != null){
            resultMap.put("m_grade",0L);
            resultMap.put("m_id",null);
        }
        return resultMap;
    }

    public String searchid(String memberDTO) {
        return sql.selectOne("Member.searchId",memberDTO);
    }
}
