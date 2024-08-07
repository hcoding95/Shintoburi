package com.kh.sintoburi.controller.hc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hc/main/*")
public class TestController {
	
	@GetMapping("/main")
	public void main() {
		
	}
	
	@GetMapping("/blog")
	public void blog() {
		
	}
	
}
