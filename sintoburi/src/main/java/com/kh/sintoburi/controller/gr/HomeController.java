package com.kh.sintoburi.controller.gr;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.sintoburi.domain.gr.LoginDto;

@Controller
public class HomeController {
	
	
	@RequestMapping(value = "/gr", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		LoginDto loginDto = new LoginDto();
		loginDto.setUser_id("user01");
		loginDto.setUser_pw("1234");
		loginDto.setUser_name("유저01");
		loginDto.setGrade("구매자");
		session.setAttribute("login", loginDto);
		
		return "redirect:/gr/basket/list";
	}
	
}
