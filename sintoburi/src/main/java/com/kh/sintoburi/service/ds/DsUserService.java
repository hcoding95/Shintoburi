package com.kh.sintoburi.service.ds;

import com.kh.sintoburi.domain.common.LoginDto;
import com.kh.sintoburi.domain.common.UserVo;
import com.kh.sintoburi.domain.ds.DsUserVo;


public interface DsUserService {
	public Integer getUserPoint(String user_id);
	public boolean registerUser(DsUserVo vo);
	public Integer checkUserId(String user_id);
	public UserVo login(LoginDto dto);

}
