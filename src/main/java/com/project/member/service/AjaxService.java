package com.project.member.service;

import com.project.member.dto.CartDTO;
import com.project.member.repository.AdminRepository;
import com.project.member.repository.CartRepository;
import com.project.member.repository.MemberRepository;
import com.project.member.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.project.member.dto.MemberDTO;

import java.util.HashMap;
import java.util.List;

@Service
@RequiredArgsConstructor
public class AjaxService {

    private final AdminRepository adminRepository;
    private final MemberRepository memberRepository;
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;


    public String searchid(String mEmail) {
        String result;
        result = memberRepository.searchid(mEmail);
        System.out.println(result);
        return result;
    }

    public String searchpw(HashMap<String, String> map) {
        String result;
        result = memberRepository.searchpw(map);
        return result;
    }
    public int updateInfo(HashMap<String, Integer> map) {
        return adminRepository.updateInfo(map);
    }

    public int deleteInfo(List<Integer> m_idx_list) {
        return adminRepository.deleteInfo(m_idx_list);
    }

    public int idCheck(String m_id) {
        return memberRepository.idCheck(m_id);
    }

    public int getcheckPn(String p_name) {
        return productRepository.getcheckPn(p_name);
    }

    public int getCartUpdate(CartDTO cartDTO) {
        return cartRepository.getCartUpdate(cartDTO);
    }

    public int getCartDelete(CartDTO cartDTO) {
        return cartRepository.getCartDelete(cartDTO);
    }
}
