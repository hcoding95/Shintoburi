package com.kh.sintoburi.mapper.hc;


import com.kh.sintoburi.domain.hc.HcLoginDto;
import com.kh.sintoburi.domain.hc.HcUserVo;


public interface HcUserMapper {

	public HcUserVo login(HcLoginDto dto);
	public HcUserVo searchByUserId(String user_id);
	
	
	
}
