package com.project.member.controller;


import com.project.member.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {

    private ProductService productService;

    private ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("productList.do")
    public String productList(){

        return "productList";
    }
    @GetMapping("productDetail.do")
    public String productDetail(){
        return "productDetail";
    }

}