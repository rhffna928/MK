package com.project.member.controller;


import com.project.member.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductController {

    private ProductService productService;

    private ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("productAdd.do")
    public String productAdd(){

        return "/product/productAdd";
    }
    @PostMapping("productAddProcess.do")
    public String productAddForm(){

        return "/product/productAdd";
    }
    @GetMapping("productList.do")
    public String productList(){

        return "/product/productList";
    }
    @GetMapping("productDetail.do")
    public String productDetail(){
        return "/product/productDetail";
    }
}