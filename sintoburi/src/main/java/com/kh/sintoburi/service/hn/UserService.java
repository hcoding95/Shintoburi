package com.kh.sintoburi.service.hn;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.sintoburi.domain.hn.UserDto;

public interface UserService {

	// 회원목록
	public List<UserDto> getList();

	// 등급수정
	public boolean modifyGrade(String user_id ,String grade);

	// 데이터 1개
	public UserDto selectById(String user_id);

}
