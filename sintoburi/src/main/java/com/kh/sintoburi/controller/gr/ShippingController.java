package com.kh.sintoburi.controller.gr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.sintoburi.service.gr.OrderService;

@Controller
@RequestMapping("/gr/shipping/*")
public class ShippingController {

	@Autowired
	public OrderService orderService;
	
	@GetMapping("/manager")
	public void orderForm() {
		
	}
	
	
}
