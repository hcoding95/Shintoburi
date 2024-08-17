package com.kh.sintoburi.controller.hn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.sintoburi.domain.hn.HnLoginDto;
import com.kh.sintoburi.domain.hn.HnUserDto;
import com.kh.sintoburi.service.hn.HnUserService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/hn/main/*")
@Log4j
public class HnMainController {
	
	@Autowired
	private HnUserService userService;

	
	@GetMapping("/login")
	public void login() {

	}

	@PostMapping("/loginPost")
	public String loginPost(HnLoginDto dto, HttpServletRequest request, Model model) throws Exception {
		System.out.println("dto: " + dto);
		HnUserDto userDto = userService.login(dto);
		System.out.println("userDto: " + userDto);

		if (userDto != null) {
			// 로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute("login", userDto);

			String location = null;
			switch (userDto.getGrade()) {
			case "판매자":
				location = "/hn/mypage/myPageMain";
				break;
			case "구매자":
				location = "/hn/mypage/myPageMain";
				break;
			case "관리자":
				location = "/hn/manager/user/userList";
				break;
			default:
				location = "/";
				break;
			}

			return "redirect:" + location;
		} else {
			// 로그인실패
			model.addAttribute("loginError", "아이디 또는 비밀번호가 잘못되었습니다.");
			return "/hn/main/login";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/hn/main/login";

	}

	@GetMapping("/join")
	public void join() {

	}

}
