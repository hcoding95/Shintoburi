package com.kh.sintoburi.service.hn;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.hn.UserDto;
import com.kh.sintoburi.mapper.hn.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	@Override
	public List<UserDto> getList() {
		List<UserDto> list = userMapper.getList();
		return list;
	}

	@Override
	public boolean modifyGrade(UserDto dto) {
		int count = userMapper.updateGrade(dto);
		return (count == 1)? true : false;
	}

	@Override
	public UserDto selectById(String user_id) {
		UserDto dto = userMapper.selectById(user_id);
		return dto;
	}

}
