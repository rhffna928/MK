package com.project.member.service;

import com.project.member.dto.MemberDTO;
import com.project.member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberRepository memberRepository;
    //회원가입
    public int save(MemberDTO memberDTO) {
        return memberRepository.save(memberDTO);
    }
    
    //로그인
    public String login(MemberDTO memberDTO, HttpSession session) {
        String loginResult = memberRepository.login(memberDTO);

        if(loginResult != null){
            session.setAttribute("m_id",memberDTO.getM_id());
            session.setAttribute("m_id",memberDTO.getM_grade());
        }
        return loginResult;

    }
}
