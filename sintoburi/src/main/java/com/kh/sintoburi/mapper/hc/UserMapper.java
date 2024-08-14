package com.kh.sintoburi.mapper.hc;


import com.kh.sintoburi.domain.hc.LoginDto;
import com.kh.sintoburi.domain.hc.UserVo;


public interface UserMapper {

	public UserVo login(LoginDto dto);
	public UserVo searchByUserId(String user_id);
	
	
	
}
