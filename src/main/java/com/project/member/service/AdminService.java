package com.project.member.service;

import com.project.member.dto.Criteria;
import com.project.member.dto.MemberDTO;
import com.project.member.dto.OrderDTO;
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

    public List<OrderDTO> orderlist() {
        return adminRepository.orderList();
    }

    public int getTotal(Criteria cri) {
        return adminRepository.getTotal(cri);
    }
}
