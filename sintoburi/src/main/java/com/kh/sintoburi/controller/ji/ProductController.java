package com.kh.sintoburi.controller.ji;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.sintoburi.domain.ji.ImageVo;
import com.kh.sintoburi.domain.ji.ProductRegisterDto;
import com.kh.sintoburi.domain.ji.ProductVo;
import com.kh.sintoburi.service.ji.ImageService;
import com.kh.sintoburi.service.ji.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/product/*")
@Log4j
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private ImageService imageService;
	
	// 쇼핑몰 메인 (원본)
//	@GetMapping("/productMain")
//	public String list(Model model) {
//	    List<ProductVo> productList = productService.getProducts();
//	    List<ImageVo> imageList = new ArrayList<>();
//	    log.info("productList:" + productList);
//	    
//	    for (ProductVo product : productList) {
//	        ImageVo imageVo = imageService.getImageByProductNo(product.getPno());
//	        log.info("imageVo:" + imageVo);
//	        if (imageVo != null) {
//	            imageList.add(imageVo);
//	        } else {
//	            log.info("이미지 찾기 실패: " + product.getPno());
//	        }
//	    }
//	    model.addAttribute("list", productList); 
//	    model.addAttribute("imageList", imageList); 
//	    log.info("imageList: " + imageList);
//	    
//	    return "product/productMain";
//	}
	
	@GetMapping("/productMainCate")
	public String productMainCate(Model model) {
		List<ProductVo> cate1List = productService.selectProductsByCate(1);
		List<ProductVo> cate2List = productService.selectProductsByCate(2);
		List<ProductVo> cate3List = productService.selectProductsByCate(3);
		List<ProductVo> cate4List = productService.selectProductsByCate(4);
		
		model.addAttribute("cate1List", cate1List);
		model.addAttribute("cate2List", cate2List);
		model.addAttribute("cate3List", cate3List);
		model.addAttribute("cate4List", cate4List);
		
		return "product/productMainCate";
	}
	
	// 상품 상세보기 
//	@GetMapping("/productDetail")
//	public void productDetail() {
//		log.info("productDetail...");
//	}
	
	// 상품 상세보기
	@GetMapping("/productDetail")
	public String productDetail(@RequestParam("pno") int pno, Model model) {
		ProductVo product = productService.getProductByNo(pno);
		List<ImageVo> images = imageService.getImgList(pno);

		System.out.println("product:" + product);
	    System.out.println("Images: " + images);
	    
		model.addAttribute("product", product);
		model.addAttribute("images", images);
		
		
		
		return "product/productDetail";
	}
	
	// 상품 추가 폼
	@GetMapping("/addProduct")
	public void addProduct() {
		log.info("addProduct...");
	}
	
	
	// 상품 추가 페이지
	@PostMapping("/addProduct")
	public String showAddForm(ProductRegisterDto registerDto, Model model) {
	    log.info("registerdto: " + registerDto);

		String uploadPath = "G:/upload/"/* + getFolder() */;

	    File uploadDir = new File(uploadPath);
	    if (!uploadDir.exists()) {
	        uploadDir.mkdirs();
	    }

	    MultipartFile multi = registerDto.getProductImg();
	    String orgName = multi.getOriginalFilename();
	    String uuid = UUID.randomUUID().toString();

	    String fileName = uuid + "_" + orgName;
	    File saveFile = new File(uploadPath, fileName);

	    try {
	        multi.transferTo(saveFile);
	        log.info("파일 저장 성공: " + saveFile.getAbsolutePath());
	    } catch (Exception e) {
	        log.info("파일 저장 실패", e);
	    }

	    ImageVo imageVo = new ImageVo();
	    imageVo.setUuid(uuid);
	    imageVo.setImg_name(orgName);
	    
	    imageVo.setImg_path(uploadPath);
	    
	    ProductVo productVo = new ProductVo();
	    productVo.setName(registerDto.getName());
	    productVo.setContent(registerDto.getContent());
	    productVo.setPrice(registerDto.getPrice());
	    productVo.setStock(registerDto.getStock());
	    productVo.setStatus(registerDto.getStatus());
	    productVo.setCate_no(registerDto.getCate_no());

	    Integer pno = productService.register(productVo);
	    if (pno != null) {
	        log.info("상품 등록 성공: " + pno);
	        imageVo.setPno(pno);
	        imageService.saveImage(imageVo); 
	        log.info("이미지 : " + imageVo);
	    } else {
	        log.info("상품 저장 실패");
	    }

	    model.addAttribute("product", productVo);
	    return "redirect:/product/productMain"; 
	}
	
	
//	private String getFolder() {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
//		Date today = new Date();
//		String folders = sdf.format(today);
//		return folders;
//	}
    
	// 상품 추가 페이지 (원본)
//		@PostMapping("/addProduct")
//	    public String showAddForm(ProductRegisterDto registerDto, Model model) {
//			log.info("registerdto:" + registerDto);
//			
//			String uploadPath = "G:/upload/" + getFolder();
//			
//			MultipartFile multi = registerDto.getProductImg();
//			String orgName = multi.getOriginalFilename();
//			String uuid = UUID.randomUUID().toString();
//			
//			ImageVo imageVo = new ImageVo();
//			imageVo.setUuid(uuid);
//			imageVo.setImg_name(orgName);
//			imageVo.setImg_path(uploadPath);
//			
//	        model.addAttribute("product", new ProductVo());
//	        return "product/addProduct"; 
//	    }

		
}
