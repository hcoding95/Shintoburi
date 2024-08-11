package com.kh.sintoburi.controller.hc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.sintoburi.domain.hc.AttachFileDto;
import com.kh.sintoburi.domain.hc.BlogVo;
import com.kh.sintoburi.domain.hc.ProductDto;
import com.kh.sintoburi.domain.hc.ProductTagDto;
import com.kh.sintoburi.service.hc.BlogService;
import com.kh.sintoburi.service.hc.ProductService;

@Controller
@RequestMapping("/hc/blog/*")
public class BlogController {
	
	@Autowired
	private BlogService blogService;
	
	@GetMapping("/blog")
	public void blog() {
	}
	
	@GetMapping("/detail")
	public void detail() {
		
	}
	
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/registerAction")
	public String registeraction(BlogVo blogVo) {
		System.out.println("내가받은 blogvo는?" + blogVo);
		String path = "";
		if(blogService.insert(blogVo)) {
			path="redirect:/hc/main/home";
		} else {
			path="redirect:/hc/blog/register";
		}
		return path;
	}
	

}
