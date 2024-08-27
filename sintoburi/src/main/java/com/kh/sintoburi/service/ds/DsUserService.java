package com.kh.sintoburi.service.ds;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.kh.sintoburi.domain.ds.DsBoardVo;
import com.kh.sintoburi.domain.ds.DsLoginDto;
import com.kh.sintoburi.domain.ds.DsUserVo;


public interface DsUserService {
	public Integer getUserPoint(String user_id);
	public boolean registerUser(DsUserVo vo);
	public Integer checkUserId(String user_id);
	public DsUserVo login(DsLoginDto dto);

}
