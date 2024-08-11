package com.kh.sintoburi.service.hn;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.hn.Criteria;
import com.kh.sintoburi.domain.hn.LoginDto;
import com.kh.sintoburi.domain.hn.UserDto;
import com.kh.sintoburi.domain.hn.UserVo;
import com.kh.sintoburi.mapper.hn.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	@Override
	public List<UserDto> getList(Criteria criteria) {
		List<UserDto> list = userMapper.getList();
		return list;
	}
	

	@Override
	public int getTotal(Criteria criteria) {
		int count = userMapper.getTotalCount(criteria);
		return count;
	}

	@Override
	public boolean modifyGrade(String user_id ,String grade) {
		int count = userMapper.updateGrade(user_id,grade);
		return (count == 1)? true : false;
	}

	@Override
	public UserDto selectById(String user_id) {
		UserDto dto = userMapper.selectById(user_id);
		return dto;
	}
	
	@Override
	public UserDto login(LoginDto dto) {
		UserDto userDto =	userMapper.login(dto);
		return userDto;
	}





}
