package com.kh.sintoburi.controller.hc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hc/main/*")
public class MainController {
	
	@GetMapping("/main")
	public void main() {
		
	}
	
	@GetMapping("/blog")
	public void blog() {
		System.out.println("블로그 적용");
		
	}
	
}
