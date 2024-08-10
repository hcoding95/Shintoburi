package com.kh.sintoburi.mapper.hn;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.kh.sintoburi.domain.hn.LoginDto;
import com.kh.sintoburi.domain.hn.UserDto;
import com.kh.sintoburi.domain.hn.UserVo;

public interface UserMapper {

	// 회원목록
	public List<UserDto> getList();

	// 등급수정

	public int updateGrade(@Param("user_id") String user_id, @Param("grade") String grade);

	// 데이터 1개
	public UserDto selectById(String user_id);

	// 로그인
	public UserDto login(LoginDto dto);

	// 회원가입
	public int join(UserVo vo);

	// 아이디저장
	public int checkDupId(@Param("user_id") String user_id);

	// 이메일조회
	public String getEmailById(@Param("user_id") String user_id);
	// 비밀번호변경
	public int updatePw(Map<String, String> map);

}
