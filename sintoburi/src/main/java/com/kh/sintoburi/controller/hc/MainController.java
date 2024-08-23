package com.kh.sintoburi.controller.hc;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.sintoburi.domain.hc.BlogVo;
import com.kh.sintoburi.domain.hc.HcLoginDto;
import com.kh.sintoburi.domain.hc.HcUserVo;
import com.kh.sintoburi.service.hc.BlogService;
import com.kh.sintoburi.service.hc.HcInjectionService;
import com.kh.sintoburi.service.hc.HcUserService;

@Controller
@RequestMapping("/hc/main/*")
public class MainController {
	
	@Autowired
	private HcUserService userService;
	@Autowired
	private BlogService blogService;
	@Autowired
	private HcInjectionService injectionService;
	
	@GetMapping("/home")
	public void home(Model model, HttpSession session) {
		List<BlogVo> list = blogService.getList();
		HcUserVo loginUser = (HcUserVo)session.getAttribute("login");
		String login_id = "";
		if(loginUser != null) {
			login_id = loginUser.getUser_id();
		}
		list = injectionService.checkListFollowAndLike(list, login_id);
		model.addAttribute("list", list);
	}
	
	@GetMapping("/login")
	public void login() {
		
	}
	
	@PostMapping("/loginAction")
	public String loginAction(HcLoginDto dto, HttpSession session) {
		HcUserVo loginVo = userService.login(dto);
		String path = "";
		if(loginVo != null) {
			session.setAttribute("login", loginVo);
			path = "redirect:/hc/main/home";
		} else {
			path = "redirect:/hc/main/login";
		}
		return path;
	}
	
}
