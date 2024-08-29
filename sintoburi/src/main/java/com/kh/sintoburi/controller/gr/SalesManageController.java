package com.kh.sintoburi.controller.gr;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sintoburi.domain.common.UserVo;
import com.kh.sintoburi.domain.gr.OrderDto;
import com.kh.sintoburi.service.gr.SalesManageService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/gr/sales_manage/*")
@Log4j
public class SalesManageController {

	@Autowired
	public SalesManageService salesManageService; 
	
	//관리자 판매 목록 전체 보기
	//TODO 로그인 처리
	@GetMapping("/list")
	public String deliveryManage(Model model, HttpSession session) {
		UserVo dto = (UserVo)session.getAttribute("login");
//		if (dto == null) {
//			//return "redirect:/hc/main/home";
//		}
		String user_id = dto.getUser_id();
		
	    List<OrderDto> deliveryList	= salesManageService.getSalesManageList(user_id);
	    model.addAttribute("deliveryList", deliveryList);
	    return "/gr/sales_manage/list";
	}
	
}
