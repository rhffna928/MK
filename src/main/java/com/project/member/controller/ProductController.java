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
                                 @RequestParam Map<String, String> param, Model model,
                                 MultipartFile file, HttpServletRequest request) throws Exception {

        HttpSession session = request.getSession();
        int m_idx = (int) session.getAttribute("midx");


        /*이미지추가 부분..*/
        String imgUploadPath = uploadPath + File.separator + "imgUpload";
        String ymdPath = UploadFileUtils.calPath(imgUploadPath);
        String fileName = null;
        if(file != null){
            fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(),file.getBytes(), ymdPath);
        }else {
            fileName = uploadPath + File.separator + "images" + File.separator + "non.png";
        }
        productDTO.setP_img1("'"+File.separator+"imgUpload"+ ymdPath + File.separator + fileName+"'");
        productDTO.setP_img2("'"+File.separator +"imgUpload"+ymdPath+ File.separator + "s"+File.separator + "s_" + fileName+"'");

        /**/
        String p_cate_idx = "";
        String p_cate_name =  param.get("p_cate_parent");
        if(p_cate_idx == "100000")
        {
            if(param.get("p_cate_name").equals("")) p_cate_idx ="100000";
            else if(param.get("p_cate_name").equals("스낵")) p_cate_idx ="101000";
            else if(param.get("p_cate_name").equals("스낵")) p_cate_idx ="102000";
            else if(param.get("p_cate_name").equals("뼈/육포")) p_cate_idx ="103000";
            else if(param.get("p_cate_name").equals("스틱")) p_cate_idx ="104000";
            else if(param.get("p_cate_name").equals("프리미엄")) p_cate_idx ="105000";
            else if(param.get("p_cate_name").equals("통살")) p_cate_idx ="106000";
            else if(param.get("p_cate_name").equals("프리미엄")) p_cate_idx ="107000";
            else if(param.get("p_cate_name").equals("통살")) p_cate_idx ="108000";
        }
        else if(p_cate_idx=="200000")
        {
            if(param.get("p_cate_name").equals("")) p_cate_idx ="100000";
            else if(param.get("p_cate_name").equals("스낵")) p_cate_idx ="101000";
            else if(param.get("p_cate_name").equals("스낵")) p_cate_idx ="102000";
            else if(param.get("p_cate_name").equals("뼈/육포")) p_cate_idx ="103000";
            else if(param.get("p_cate_name").equals("스틱")) p_cate_idx ="104000";
            else if(param.get("p_cate_name").equals("프리미엄")) p_cate_idx ="105000";
            else if(param.get("p_cate_name").equals("통살")) p_cate_idx ="106000";
            else if(param.get("p_cate_name").equals("프리미엄")) p_cate_idx ="107000";
            else if(param.get("p_cate_name").equals("통살")) p_cate_idx ="108000";
        }


        param.put("p_cate_idx", p_cate_idx);

        int addresult = productService.productadd(param);
        System.out.println(productDTO);
        if(addresult > 0){
            return "/product/productAdd";
        }else{
            return "/product/productList";
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
    public String productDetail(){
        return "/product/productDetail";
    }
}

/*
    @RequestMapping(value="/seller_productModifProcess.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String seller_productModifProcess(MultipartHttpServletRequest mRequest,
                                             @RequestParam Map<String, String> param,
                                             @RequestParam("p_idx") String p_idx,
                                             Model model, HttpServletRequest request
    ) throws IllegalStateException, IOException{

        System.out.println("여기는 상품수정 진행중");

        //기존 이미지 삭제했는지 여부 확인 후 디비 delyn Y로 바꾸기
        List<Product_ImgVo> productImgList = sellerService.seller_productImgs(p_idx);

        for (Product_ImgVo a : productImgList) {

            boolean result = param.containsKey("file_"+a.getP_front_img());// 파일 삭제를 눌렀는지 확인
            //System.out.println(result);
            if(result == false)//삭제하기
            {
                System.out.println(param.get("file_"+a.getP_front_img()));
                int del = sellerService.delete_img(a.getP_front_img());
            }


        }
        HttpSession session = request.getSession();
//		int midx = (int) session.getAttribute("midx");
        long midx = (long) session.getAttribute("midx");
        String member_id= Integer.toString((int) midx);

        //카테고리 분류하기
        String p_category_idx = "";
        int p_category_large =  Integer.parseInt(param.get("p_category_large"));
        if(p_category_large==1)
        {
            if(param.get("p_category_small").equals("개껌")||param.get("p_category_small").equals("1")) p_category_idx ="1";
            else if(param.get("p_category_small").equals("스낵")||param.get("p_category_small").equals("2")) p_category_idx ="2";
            else if(param.get("p_category_small").equals("뼈/육포")||param.get("p_category_small").equals("3")) p_category_idx ="3";
            else if(param.get("p_category_small").equals("스틱")||param.get("p_category_small").equals("4")) p_category_idx ="4";
            else if(param.get("p_category_small").equals("프리미엄")||param.get("p_category_small").equals("5")) p_category_idx ="5";
            else if(param.get("p_category_small").equals("통살")||param.get("p_category_small").equals("6")) p_category_idx ="6";
        }
        else if(p_category_large==2)
        {
            if(param.get("p_category_small").equals("츄르")||param.get("p_category_small").equals("1")) p_category_idx ="7";
            else if(param.get("p_category_small").equals("스낵")||param.get("p_category_small").equals("2")) p_category_idx ="8";
            else if(param.get("p_category_small").equals("캣잎")||param.get("p_category_small").equals("3")) p_category_idx ="9";
            else if(param.get("p_category_small").equals("스틱")||param.get("p_category_small").equals("4")) p_category_idx ="10";
            else if(param.get("p_category_small").equals("프리미엄")||param.get("p_category_small").equals("5")) p_category_idx ="11";
            else if(param.get("p_category_small").equals("통살")||param.get("p_category_small").equals("6")) p_category_idx ="12";
        }

        //String p_category_idx = param.get("p_category_large");

        String seller_idx=sellerService.getSellerIdx(member_id);
        System.out.println("------------------------------------------------"+seller_idx);
        System.out.println("p_category_idx"+param.get("p_category_idx"));
        System.out.println("p_category_large"+param.get("p_category_large"));
        System.out.println("p_category_small"+param.get("p_category_small"));

        param.put("seller_idx", seller_idx);
        param.put("p_category_idx", p_category_idx);
        //System.out.println("p_category_idx"+param.get("p_category_idx"));
        //System.out.println("@@@@"+p_category_idx);

        int productModi = sellerService.updateProduct(param);

        int productDel = sellerService.DelYNProduct(param);



		*/
/*
		System.out.println("seller_idx"+seller_idx);
		System.out.println("p_category_idx"+param.get("p_category_idx"));
		System.out.println("p_name"+param.get("p_name"));
		System.out.println("p_content"+param.get("p_content"));
		System.out.println("p_price"+param.get("p_price"));
		System.out.println("p_discount"+param.get("p_discount"));
		System.out.println("p_disprice"+param.get("p_disprice"));
		System.out.println("p_cancle_info"+param.get("p_cancle_info"));
		System.out.println("p_ingerdient"+param.get("p_ingerdient"));
		System.out.println("p_dvprice"+param.get("p_dvprice"));
		System.out.println("p_dvcompany"+param.get("p_dvcompany"));
		System.out.println("p_limit_cnt"+param.get("p_limit_cnt"));
		System.out.println("p_point"+param.get("p_point"));
		System.out.println("p_add_dvprice"+param.get("p_add_dvprice"));
		System.out.println("p_free_dvprice"+param.get("p_free_dvprice"));
		System.out.println("p_size"+param.get("p_size"));
		System.out.println("p_status"+param.get("p_status"));
		System.out.println("p_stock"+param.get("p_stock"));
		*//*



        List<MultipartFile> fileList = mRequest.getFiles("file");

        for (MultipartFile mf : fileList) {
            String p_ori_fileName = mf.getOriginalFilename().trim(); // 원본 파일 명

            //시스템 파일명은 원본 파일명에서 파일명과 확장자를 분리한 다음 파일명에 시스템시간을 추가한 후 다시 확장자를 붙이는 식으로 생성
            int dot_idx = p_ori_fileName.lastIndexOf(".");
            String fileName1 = p_ori_fileName.substring(0, dot_idx);
            String extension = p_ori_fileName.substring(dot_idx+1);
            String fileName2 = fileName1 + new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
            String p_sys_fileName = fileName2+"."+extension;

            //upload 디렉토리에 대한 실제 경로 확인을 위해 ServletContext객체를 이용
            String upload_dir = "resources/product/";

            String realPath = request.getServletContext().getRealPath(upload_dir);
            System.out.println("이클립스로 저장된 파일의 실제 경로: " + realPath);

            //지정된 경로에 파일 저장
            String fullPath = realPath+p_sys_fileName;
            System.out.println("********************************************");
            System.out.println("p_sys_fileName : " + p_sys_fileName);
            System.out.println("p_ori_fileName : " + p_ori_fileName);
            HashMap<String,String> imgFileName = new HashMap<String,String>();
            imgFileName.put("p_sys_fileName", p_sys_fileName);
            imgFileName.put("p_ori_fileName", p_ori_fileName);
            imgFileName.put("p_idx", p_idx);

            try {
                mf.transferTo(new File(fullPath));
                sellerService.addProductImg(imgFileName);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {

                e.printStackTrace();
            }
        }*/
