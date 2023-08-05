package com.project.member.service;

import com.project.member.dto.MemberDTO;
import com.project.member.repository.AdminRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AdminService {
    private final AdminRepository adminRepository;

    public List<MemberDTO> memberlist() {
        return adminRepository.memberList();
    }
}
