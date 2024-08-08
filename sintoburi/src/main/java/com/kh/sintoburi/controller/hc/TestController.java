package com.kh.sintoburi.controller.hc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/include/*")
public class TestController {
	
	@GetMapping("/top")
	public void top() {
		System.out.println("작동중");
	}
}
