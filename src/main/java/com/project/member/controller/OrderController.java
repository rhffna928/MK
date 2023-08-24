package com.project.member.controller;

import com.project.member.dto.*;
import com.project.member.service.CartService;
import com.project.member.service.MemberService;
import com.project.member.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.*;

@Controller
@RequiredArgsConstructor
public class OrderController {
    private final OrderService orderService;
    private final MemberService memberService;
    private final CartService cartService;

    @GetMapping("/order.do")
    public String order(/*@RequestParam(value = "c_idxArr") String[] c_idxArr,*/ CartDTO cartDTO,OrderDTO orderDTO,
                        ProductDTO productDTO, Model model, HttpServletRequest request){
        HttpSession Session = request.getSession();
        int m_idx = (int) Session.getAttribute("m_idx");
        cartDTO.setM_idx(m_idx);

        int c_idx = 0;

        /*Map cartlist = (Map)Session.getAttribute("cartlist");
        List myOrderList = new ArrayList<OrderDTO>();

        List<ProductDTO> myProductList = (List<ProductDTO>)cartlist.get("myProductList");

        for(int i = 0; i<c_idxArr.length;i++){
            String[] cartproduct = c_idxArr[i].split(":");
            for(int j=0;j<myProductList.size();j++){
                ProductDTO productDTO1 = myProductList.get(j);
                int p_idx = productDTO1.getP_idx();
                if(p_idx ==Integer.parseInt(cartproduct[0])){
                    OrderDTO orderDTO = new OrderDTO();
                    String p_name =  productDTO1.getP_name();

                }

            }
        }*/

        HashMap<String, String> map = new HashMap<String, String>();

        /*for(String i : c_idxArr){
            c_idx = Integer.parseInt(i);

            System.out.println("cart -> CHK orderList : "+c_idx);
        }*/
        /*for(String i : p_idxArr){
            p_idx = Integer.parseInt(i);

            System.out.println("cart -> CHK orderList : "+p_idx);
        }*/

        List<ProductDTO> productList = orderService.getProductInfo(m_idx);
        /*List<ProductDTO> ProductMap = orderService.getProductInfo(m_idx,p_idx);*/
        /*List<ProductDTO> ProductMap = orderService.getProductInfo(productDTO);*/
        /*HashMap<String, Object> productPrice = cartService.getProductPrice(m_idx);*/
        HashMap<String, Object> productPrice = cartService.getProductPrice(m_idx);
        /*HashMap<String,Object> productTotalPrice = orderService.getTotalPrice(m_idx, c_idx);*/
        model.addAttribute("productList",productList);
        model.addAttribute("productPrice", productPrice);
        System.out.println(productList);
        System.out.println("전체가격"+productPrice);
        return "/order/orders";
    }
    @PostMapping("/orderInsert.do")
    public String orderInsert(@RequestParam("c_idx") int[] c_idx,OrderDTO orderDTO, DetailDTO detailDTO, HttpServletRequest request) {

        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
        String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
        String subNum = "";

        for(int i = 1; i <= 6; i ++) {
            subNum += (int)(Math.random() * 10);
        }

        String o_idx = ymd + "_" + subNum;

        List<OrderListDTO> ords = new ArrayList<>();

        for(OrderListDTO olt : orderDTO.getOrders()){
            OrderListDTO orderListDTO = new OrderListDTO();
            orderListDTO.setC_idx(olt.getC_idx());
            orderListDTO.setC_cnt(olt.getC_cnt());
            ords.add(olt);

        }

        System.out.println("카트아이디 : "+c_idx);
        orderDTO.setO_idx(o_idx);
        orderDTO.setO_delivery("상품 준비중");
        detailDTO.setO_idx(o_idx);

        orderService.getupdatepcnt(orderDTO);
        orderService.getinsertorder(orderDTO);
        orderService.getinsertdetail(detailDTO);
        orderService.getorderdlt(orderDTO);

        System.out.println("주문 : "+orderDTO);
        System.out.println("주문디테일 : "+detailDTO);

        return "redirect:/index.do";
    }


}
