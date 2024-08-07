package com.kh.sintoburi.controller.hc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hc/main/*")
public class TestController {
	
	@GetMapping("/top")
	public void top ()	{
		System.out.println("이거임");
	}
	
	@GetMapping("/bottom")
	public void bottom()	{
		System.out.println("이거임");
	}
	
	@GetMapping("/main")
	public void main() {
		
	}
	
}
