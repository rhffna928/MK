package com.project.member.controller;

import com.project.member.dto.CartDTO;
import com.project.member.service.AjaxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;


@RestController /*Spring 4.0 부터 지원 @Controller 와 @ResponseBody 기능*/
public class AjaxController {
    private AjaxService ajaxService;

    @Autowired //자동 의존 주입: 생성자 방식
    public AjaxController(AjaxService ajaxService) {
        this.ajaxService = ajaxService;
    }


    @PostMapping("/idCheck.do")
    public String idCheck(@RequestParam("m_id") String m_id){
        String result = "N";
        int flag = ajaxService.idCheck(m_id);
        if(flag == 1) result = "Y";
        System.out.println("아이디는"+result);
        return result;
    }

    @PostMapping("/searchIdProcess.do")
    public String searchIdProcess(@RequestParam("m_email") String m_email){

        String result = ajaxService.searchid(m_email);
        System.out.println("아이디는"+result);
        return result;
    }

    @PostMapping("/searchPwProcess.do")
    public String searchPwProcess(@RequestParam("m_id") String m_id,@RequestParam("m_tel") String m_tel){

        HashMap<String, String> map = new HashMap<String, String>();

        map.put("m_id",m_id);
        map.put("m_tel",m_tel);
        System.out.println(map);
        String result = ajaxService.searchpw(map);
        return result;
    }
    @PostMapping("/adminUpdateInfo.do")
    public String adminUpdateInfo(@RequestParam("m_idx") int m_idx,
                                  @RequestParam("m_grade") int m_grade){

        HashMap<String, Integer> map = new HashMap<String, Integer>();
        map.put("m_grade",m_grade);
        map.put("m_idx",m_idx);

        String result = "N";

        int flag = ajaxService.updateInfo(map);

        if(flag == 1) result = "Y";

        System.out.println(result);
        return result;
    }

    @PostMapping("/adminDeleteInfo.do")
    public String adminDeleteInfo(@RequestParam("m_idx_arr[]") List<Integer> m_idx_list){

        String result = "N";
        int flag = ajaxService.deleteInfo(m_idx_list);;

        System.out.println(m_idx_list);
        if(flag == 1) result = "Y";
        return result;
    }
    //상품 이름 체크
    @PostMapping("/checkPn.do")
    public String checkPn(@RequestParam("p_name") String p_name){
        String result = "N";
        int flag = ajaxService.getcheckPn(p_name);
        if(flag == 1) result = "Y";
        return result;
    }

    //장바구니 버튼 업데이트 이름 체크
    @PostMapping("/cartUpdate.do")
    public String cartUpdate(@ModelAttribute CartDTO cartDTO){
        String result = "N";
        int flag = ajaxService.getCartUpdate(cartDTO);
        if(flag == 1) result = "Y";
        System.out.println(cartDTO);
        System.out.println(flag);
        return result;
    }

}
