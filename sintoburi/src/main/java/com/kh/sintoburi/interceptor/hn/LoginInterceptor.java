package com.kh.sintoburi.interceptor.hn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final String LOGIN = "login";
	
	@Override
	public void postHandle(HttpServletRequest request,HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		System.out.println("postHandle...");
		Object obj = modelAndView.getModel().get("userVo");
		System.out.println("obj:" + obj);
		
		if (obj == null) { // 로그인 실패
			// response.sendRedirect("/user/login");
			modelAndView.setViewName("redirect:/user/login");
		} else {
			// 로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute(LOGIN, obj);
			// response.sendRedirect("/");
			String location ="/";
			String targetLocation =(String)session.getAttribute("targetLocation");
			if(targetLocation != null) {
				location = targetLocation;
			}
			System.out.println("location:" + location);
			modelAndView.setViewName("redirect:" + location); 
		}
		
	}
}
