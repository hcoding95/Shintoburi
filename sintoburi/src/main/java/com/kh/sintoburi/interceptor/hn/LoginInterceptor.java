package com.kh.sintoburi.interceptor.hn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.sintoburi.domain.hn.UserDto;
import com.kh.sintoburi.domain.hn.UserVo;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	
	 @Override
	    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	                           ModelAndView modelAndView) throws Exception {
	        System.out.println("postHandle...");
	        if (modelAndView != null) {
	            Object obj = modelAndView.getModel().get("userDto");
	            System.out.println("obj:" + obj);

	            if (obj == null) { // 로그인 실패
	                modelAndView.setViewName("redirect:/user/login");
	            } else {
	                // 로그인 성공
	                HttpSession session = request.getSession();
	                UserDto userDto = (UserDto) obj;
	                session.setAttribute("login", userDto);

	                // 등급에 따라 다른 페이지로 리다이렉트
	                String location;
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

	                System.out.println("location:" + location);
	                modelAndView.setViewName("redirect:" + location);
	            }
	        }
	    }
}
