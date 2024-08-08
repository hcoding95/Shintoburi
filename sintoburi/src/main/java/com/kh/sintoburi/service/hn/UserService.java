package com.kh.sintoburi.service.hn;

import java.util.List;

import com.kh.sintoburi.domain.hn.UserDto;

public interface UserService {

	// 회원목록
	public List<UserDto> getList();

	// 등급수정
	public boolean modifyGrade(String grade, String user_id);

	// 데이터 1개
	public UserDto selectById(String user_id);

}
