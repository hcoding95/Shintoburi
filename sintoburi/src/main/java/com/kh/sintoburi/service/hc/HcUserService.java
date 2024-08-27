package com.kh.sintoburi.service.hc;


import com.kh.sintoburi.domain.hc.HcLoginDto;
import com.kh.sintoburi.domain.hc.HcUserVo;

public interface HcUserService {
	
	public HcUserVo login(HcLoginDto dto);
	public HcUserVo searchByUserId (String user_id);

}
