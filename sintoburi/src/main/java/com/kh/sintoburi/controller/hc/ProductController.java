package com.kh.sintoburi.controller.hc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sintoburi.domain.hc.ProductDto;
import com.kh.sintoburi.service.hc.ProductService;

@Controller
@RequestMapping("/hc/product/*")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@PostMapping("/getList")
	@ResponseBody
	public List<ProductDto> getList(@RequestBody ProductDto dto){
		List<ProductDto> list = productService.getProductList(dto);
		return list;
	}
	
	
	
	
	
	
	
	
	
	
}
