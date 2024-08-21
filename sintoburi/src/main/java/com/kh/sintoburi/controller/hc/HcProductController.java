package com.kh.sintoburi.controller.hc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sintoburi.domain.hc.HcProductTagDto;
import com.kh.sintoburi.service.hc.HcProductService;

@Controller
@RequestMapping("/hc/product/*")
public class HcProductController {

	@Autowired
	private HcProductService productService;
	
	@PostMapping("/getList")
	@ResponseBody
	public List<HcProductTagDto> getList(@RequestBody HcProductTagDto dto){
		System.out.println("내가받은 productTagDto는?" + dto);
		List<HcProductTagDto> list = productService.getProductList(dto);
		return list;
	}
	
	
	
	
	
	
	
	
	
	
}
