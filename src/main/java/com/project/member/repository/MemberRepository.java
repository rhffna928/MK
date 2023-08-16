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

    public int idCheck(String m_id) {
        return sql.selectOne("Member.idCheck",m_id);
    }
    //회원가입
    public int save(MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO );

        return sql.insert("Member.save",memberDTO);
    }
    //로그인
    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login",memberDTO);
    }
    //아이디찾기
    public String searchid(String memberDTO) {
        return sql.selectOne("Member.searchId",memberDTO);
    }

    public String searchpw(HashMap<String, String> map) {
        return sql.selectOne("Member.searchPw",map);
    }

    public MemberDTO getMemberInfo(int m_idx) {
        return sql.selectOne("Member.memberInfo",m_idx);
    }

    public int getChangeAddr(MemberDTO memberDTO) {
        return sql.update("Member.changeAddr", memberDTO);
    }
}
