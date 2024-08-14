package com.kh.sintoburi.service.hc;


import com.kh.sintoburi.domain.hc.LoginDto;
import com.kh.sintoburi.domain.hc.UserVo;

public interface UserService {
	
	public UserVo login(LoginDto dto);
	

}
