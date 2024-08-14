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
import com.kh.sintoburi.domain.hc.LoginDto;
import com.kh.sintoburi.domain.hc.UserVo;
import com.kh.sintoburi.service.hc.BlogService;
import com.kh.sintoburi.service.hc.UserService;

@Controller
@RequestMapping("/hc/main/*")
public class MainController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private BlogService blogService;
	
	@GetMapping("/home")
	public void home(Model model) {
		List<BlogVo> list = blogService.getList();
		model.addAttribute("list", list);
	}
	
	@GetMapping("/login")
	public void login() {
		
	}
	
	@PostMapping("/loginAction")
	public String loginAction(LoginDto dto, HttpSession session) {
		System.out.println("내가 받은 dto는?" + dto);
		UserVo loginVo = userService.login(dto);
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
