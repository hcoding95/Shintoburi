package com.kh.sintoburi.service.hn;

import java.util.List;

import com.kh.sintoburi.domain.hn.Criteria;
import com.kh.sintoburi.domain.hn.LoginDto;
import com.kh.sintoburi.domain.hn.UserDto;

public interface UserService {

	// 회원목록
	public List<UserDto> getList(Criteria criteria);

	// 갯수
	public int getTotal(Criteria criteria);

	// 등급수정
	public boolean modifyGrade(String user_id, String grade);

	// 데이터 1개
	public UserDto selectById(String user_id);

	// 로그인
	public UserDto login(LoginDto dto);

}
