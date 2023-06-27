package com.project.member.service;

import com.project.member.dto.MemberDTO;
import com.project.member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberRepository memberRepository;

    public int save(MemberDTO memberDTO) {
        return memberRepository.save(memberDTO);
    }
    //로그인
    public HashMap<String, Long> login(HashMap<String, String>logininfo) {
        return memberRepository.login(logininfo);
    }
}
