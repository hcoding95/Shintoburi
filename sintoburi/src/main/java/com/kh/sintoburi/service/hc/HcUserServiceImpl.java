package com.kh.sintoburi.service.hc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.hc.HcLoginDto;
import com.kh.sintoburi.domain.hc.HcUserVo;
import com.kh.sintoburi.mapper.hc.HcUserMapper;

@Service
public class HcUserServiceImpl implements HcUserService {
	
	@Autowired
	private HcUserMapper userMapper;

	@Override
	public HcUserVo login(HcLoginDto dto) {
		HcUserVo userVo = userMapper.login(dto);
		return userVo;
	}

	@Override
	public HcUserVo searchByUserId(String user_id) {
		HcUserVo userVo = userMapper.searchByUserId(user_id);
		return userVo;
	}
	
	
	
	
}
