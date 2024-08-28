package com.kh.sintoburi.controller.gr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.sintoburi.domain.gr.OrderDto;
import com.kh.sintoburi.service.gr.DeliveryService;

@Controller
@RequestMapping("/gr/delivery/*")
public class DeliveryController {

	@Autowired
	public DeliveryService deliveryService; 
	
	@GetMapping("/delivery_manage")
	public String deliveryManage(Model model) {
	    List<OrderDto> deliveryList	= deliveryService.getDeliveryManageList();
	    model.addAttribute("deliveryList", deliveryList);
	    return "/gr/delivery/delivery_manage";
	}
	
	
}
