package com.kh.sintoburi.serviceDs;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.kh.sintoburi.domainDs.DsBoardVo;
import com.kh.sintoburi.domainDs.DsLoginDto;
import com.kh.sintoburi.domainDs.DsUserVo;


public interface DsUserService {
	public Integer getUserPoint(String user_id);
	public boolean registerUser(DsUserVo vo);
	public Integer checkUserId(String user_id);
	public DsUserVo login(DsLoginDto dto);

}
