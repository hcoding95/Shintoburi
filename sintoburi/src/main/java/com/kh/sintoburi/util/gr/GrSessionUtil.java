package com.kh.sintoburi.util.gr;

import javax.servlet.http.HttpSession;

import com.kh.sintoburi.domain.gr.LoginUser;

public class GrSessionUtil {

	public static String getUserIdInLoginSession(HttpSession session) {
		LoginUser dto = (LoginUser)session.getAttribute("login");
		if (dto != null) {
			return dto.getUser_id();
		}
		return null;
	}
}
