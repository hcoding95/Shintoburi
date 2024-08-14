package com.kh.sintoburi.service.hc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.hc.LoginDto;
import com.kh.sintoburi.domain.hc.UserVo;
import com.kh.sintoburi.mapper.hc.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public UserVo login(LoginDto dto) {
		UserVo userVo = userMapper.login(dto);
		return userVo;
	}
	
	
	
	
}
