package com.project.member.controller;


import com.project.member.dto.ProductDTO;
import com.project.member.service.ProductService;
import com.project.member.utils.UploadFileUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ImportResource;
import org.springframework.jmx.export.annotation.ManagedResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;
    @Resource(name="uploadPath")
    private String uploadPath;

    @GetMapping("productAdd.do")
    public String productAdd(HttpSession session){


        return "/product/productAdd";
    }

    @PostMapping("productAddProcess.do")
    public String productAddForm(@ModelAttribute ProductDTO productDTO, MultipartHttpServletRequest mRequest,
                                 MultipartFile file, HttpServletRequest request) throws Exception {

        //이미지추가 부분..
        String imgUploadPath = uploadPath + File.separator + "imgUpload";
        String ymdPath = UploadFileUtils.calPath(imgUploadPath);
        String fileName;
        if(file != null){
            fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(),file.getBytes(), ymdPath);
        }else {
            fileName = uploadPath + File.separator + "images" + File.separator + "non.png";
        }
        productDTO.setP_img1(File.separator+"imgUpload"+ ymdPath + File.separator + fileName);
        productDTO.setP_img2(File.separator +"imgUpload"+ymdPath+ File.separator + "s"+File.separator + "s_" + fileName);


        int addresult = productService.productadd(productDTO);
        if(addresult < 0){
            return "/product/productAdd";
        }else{
            return "redirect:/productList.do";
        }
    }
    @GetMapping("productList.do")
    public String productList(Model model, HttpServletRequest request){
        List<ProductDTO> productDTO = productService.getProductList();

        model.addAttribute("p_list",productDTO);
        System.out.println(productDTO);
        return "/product/productList";
    }
    @GetMapping("productDetail.do")
    public String productDetail(Model model, HttpServletRequest request){
        List<ProductDTO> productDTO = productService.getProductList();

        model.addAttribute("p_list",productDTO);
        System.out.println(productDTO);
        return "/product/productDetail";
    }

    @GetMapping("productView.do")
    public String productView(@RequestParam("p_idx") int p_idx,Model model,
                              HttpServletRequest request){

        ProductDTO productView = productService.getProductView(p_idx);
        model.addAttribute("p_View",productView);
        return "/product/productView";
    }

    @GetMapping("productModi.do")
    public String product(@RequestParam("p_idx") int p_idx,Model model,
                          HttpServletRequest request){

        ProductDTO productView = productService.getProductView(p_idx);
        model.addAttribute("p_Modi",productView);

        return "/product/productModi";
    }


    @GetMapping("productModiProcess.do")
    public String productModiProcess(@RequestParam ProductDTO productDTO,@RequestParam("p_idx") int p_idx,Model model,
                                     HttpServletRequest request,MultipartHttpServletRequest mRequest,
                                     MultipartFile file) throws Exception {

        String imgUploadPath = uploadPath + File.separator + "imgUpload";
        String ymdPath = UploadFileUtils.calPath(imgUploadPath);
        String fileName;
        if(file != null){
            fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(),file.getBytes(), ymdPath);
        }else {
            fileName = uploadPath + File.separator + "images" + File.separator + "non.png";
        }
        productDTO.setP_img1(File.separator+"imgUpload"+ ymdPath + File.separator + fileName);
        productDTO.setP_img2(File.separator +"imgUpload"+ymdPath+ File.separator + "s"+File.separator + "s_" + fileName);


        int result = productService.getProductModi(p_idx);
        if (result == 1)return "redirect:/productView.do";

        return "/product/productModi";

    }


}

