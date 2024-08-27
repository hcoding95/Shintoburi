package com.kh.sintoburi.service.ds;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.ds.DsLoginDto;
import com.kh.sintoburi.domain.ds.DsReplyVo;
import com.kh.sintoburi.domain.ds.DsReportVo;
import com.kh.sintoburi.domain.ds.DsUserVo;
import com.kh.sintoburi.mapper.ds.DsReplyMapper;
import com.kh.sintoburi.mapper.ds.DsReportMapper;
import com.kh.sintoburi.mapper.ds.DsUserMapper;

@Service
public class DsUserServiceImpl implements DsUserService {

	@Autowired
	private DsUserMapper userMapper;

	@Override
	public Integer getUserPoint(String user_id) {
		
		return userMapper.select(user_id);
	}

	@Override
	public boolean registerUser(DsUserVo vo) {
		
		return userMapper.insert(vo)>0?true:false;
	}

	@Override
	public Integer checkUserId(String user_id) {
	
		return userMapper.selectByUserId(user_id);
	}

	@Override
	public DsUserVo login(DsLoginDto dto) {
		
		return userMapper.selectLoginUser(dto);
	}


	
	
	
	
}
