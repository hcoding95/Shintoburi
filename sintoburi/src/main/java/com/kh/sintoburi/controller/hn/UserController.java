package com.kh.sintoburi.controller.hn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.sintoburi.domain.hn.LoginDto;
import com.kh.sintoburi.domain.hn.UserDto;
import com.kh.sintoburi.service.hn.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/hn/user/*")
@Log4j
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping("/login")
	public void login() {

	}

	@PostMapping("/loginPost")
	public String loginPost(LoginDto dto, HttpServletRequest request, Model model) throws Exception {
	    System.out.println("dto: " + dto);
	    UserDto userDto = userService.login(dto);
	    System.out.println("userDto: " + userDto);

	    if (userDto != null) {
	        // 로그인 성공
	        HttpSession session = request.getSession();
	        session.setAttribute("login", userDto); // 세션에 UserDto 객체 설정

	        // 등급에 따라 적절한 페이지로 리다이렉트
	        String location = null;
	        switch (userDto.getGrade()) {
	        case "판매자":
	            location = "/hn/";
	            break;
	        case "구매자":
	            location = "/hn/";
	            break;
	        case "관리자":
	            location = "/hn/manager/userList";
	            break;
	        default:
	            location = "/";
	            break;
	        }

	        return "redirect:" + location;
	    } else {
	        // 로그인 실패
	        model.addAttribute("loginError", "아이디 또는 비밀번호가 잘못되었습니다.");
	        return "/hn/user/login"; // 로그인 페이지로 돌아가기
	    }
	}

	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 현재 세션 무효화
		return "redirect:/hn/user/login";

	}

	@GetMapping("/join")
	public void join() {

	}

}
