package com.kh.sintoburi.mapper.hn;

import java.util.List;

import com.kh.sintoburi.domain.hn.UserDto;

public interface UserMapper {
	
	// 회원목록
	public List<UserDto> getList();
	// 등급수정
	public int updateGrade(UserDto dto);
	
	// 데이터 1개
	public UserDto selectById(String user_id);

}
