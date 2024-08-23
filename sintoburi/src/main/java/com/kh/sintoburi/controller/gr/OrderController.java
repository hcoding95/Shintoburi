package com.kh.sintoburi.controller.gr;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sintoburi.domain.gr.DeliveryDto;
import com.kh.sintoburi.domain.gr.LoginUser;
import com.kh.sintoburi.domain.gr.OrderDetailDto;
import com.kh.sintoburi.domain.gr.OrderVo;
import com.kh.sintoburi.service.gr.OrderService;
import com.kh.sintoburi.util.gr.GrSessionUtil;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/gr/order/*")
@Log4j
public class OrderController {

	@Autowired
	public OrderService orderService;
	
	//체크한 것 주문하기로 넘겨주기, 삭제
	@PostMapping("/runOrder")
	public String runOrder(HttpSession session, OrderVo orderVo) {
		LoginUser dto = (LoginUser)session.getAttribute("login");
		
		// bdno값 받기
		int[] bdnos = (int[])session.getAttribute("bdnos");
		for (int bdno : bdnos) {
			log.info("bdno:" + bdno);
		}
			
		//로그인한 상태
		if (dto == null) {
			return "redirect:/gr";
		}
		String user_id = dto.getUser_id();
		orderVo.setUser_id(user_id);
		
		boolean result = orderService.runOrder(orderVo, bdnos);
		log.info(result);
		log.info("orderVo:" + orderVo);
		return "redirect:/gr/order/order_list";
	}	
			
	@GetMapping("/order_form")
	public void orderForm(HttpSession session) {
		 int[] bdnos =(int[])session.getAttribute("bdnos");
		 for (int bdno : bdnos) {
			 log.info(bdno);
		 }
	}
	
	@GetMapping("/getDeliveryInfo")
	@ResponseBody
	public DeliveryDto getDeliveryInfo(HttpSession session) {
		String user_id =  GrSessionUtil.getUserIdInLoginSession(session);
		DeliveryDto dto = orderService.getDeliveryInfo(user_id);
//		dto.setUser_name("이규림");
//		dto.setUser_phone("010-4444-4444");
//		dto.setAddress("울산시 남구");
//		dto.setPayment("포인트");
		return dto;
	}
	
	@GetMapping("/order_list")
	public String orderList(Model model, HttpSession session ){
		LoginUser dto = (LoginUser)session.getAttribute("login");
		// dto가 null인지 확인
	    if (dto == null) {
	        return "redirect:/gr"; // 세션에 login 정보가 없으면 로그인 페이지로 리디렉션
	    }
		//System.out.println("dto:" + dto);
		String user_id = dto.getUser_id();
		//System.out.println("user_id: "+ user_id);
		
		List<OrderVo> orderList = orderService.getOrderList(user_id);
		model.addAttribute("orderList", orderList);
		return "/gr/order/order_list";
	}
	
	@GetMapping("/detail/{ono}")
	public String getDetailList(@PathVariable("ono") int ono,
			Model model, HttpSession session ){
		LoginUser dto = (LoginUser)session.getAttribute("login");
		// dto가 null인지 확인
	    if (dto == null) {
	        return "redirect:/gr"; // 세션에 login 정보가 없으면 로그인 페이지로 리디렉션
	    }
		//System.out.println("dto:" + dto);
		String user_id = dto.getUser_id();
		//System.out.println("user_id: "+ user_id);
		
		List<OrderDetailDto> detailList = orderService.getDetailList(user_id, ono);
		model.addAttribute("detailList", detailList);
		return "/gr/order/detail";
	}
	
	@PostMapping("/pre_order")
	public String preOrder(@RequestParam("bdnos") int[] bdnos, HttpSession session) {
		session.setAttribute("bdnos", bdnos);
		return "redirect:/gr/order/order_form";
	}
	
}
