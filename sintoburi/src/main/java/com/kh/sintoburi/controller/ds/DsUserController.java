package com.kh.sintoburi.controller.ds;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.sintoburi.domain.common.LoginDto;
import com.kh.sintoburi.domain.common.UserVo;
import com.kh.sintoburi.service.ds.DsUserService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/ds/user/*")
@RestController
@RequiredArgsConstructor
public class DsUserController {
	
	@Autowired
	private DsUserService userService;
	
	
	// 유저의 포인트를 불러옴
	@PostMapping("/getPoint")
	@ResponseBody
	public Integer getPoint(@RequestBody Map<String, String>map) {
		
		String user_id = map.get("user_id");
		return userService.getUserPoint(user_id);
		
	
	}
	
	// 유저 회원가입
	@PostMapping("/register")
	@ResponseBody
	public boolean register(@RequestBody UserVo vo) {
		
		
		//System.out.println(vo.toString());

		return userService.registerUser(vo);
	
	}
	
	// 아이디 중복여부 확인
	@PostMapping("/checkId")
	@ResponseBody
	public Integer checkUserId(@RequestBody Map<String, String>map) {
			
		String user_id = map.get("user_id");
		return userService.checkUserId(user_id);
			
		
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public void logout(HttpSession session,HttpServletResponse response) throws IOException {
		session.invalidate();
		response.sendRedirect("/hc/main/home");

	}
	
	
	 //로그인
	@PostMapping("/login")
	@ResponseBody
	public String login(@RequestBody LoginDto dto, HttpSession session) {
			
		UserVo vo = userService.login(dto);
		
		if(vo!=null) {
			System.out.println("세션저장");
			session.setAttribute("login", vo);
			return "success";
		} else {
			return "fail";
		}
		
	}
		
//	@PostMapping("/login")	
//	@ResponseBody
//	public String loginAction(@RequestBody LoginDto dto, HttpSession session) {			
//				
//		UserVo vo = userService.login(dto);
//		
//		String path = "";		
//		if(vo != null) {		
//			session.setAttribute("login", vo);	
////			String realPath = (String)session.getAttribute("targetLocation");	
////
////			System.out.println("내가보낼 타겟은?" + realPath);	
////			path = "redirect:" + realPath;	
//		} else {		
//			path = "redirect:/ds/board/login";	
//		}		
//		return path;		
//	}			

		
		
		
	
	
	

}
