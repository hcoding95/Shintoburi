package com.kh.sintoburi.mapper.hn;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.sintoburi.domain.hn.UserDto;

public interface UserMapper {
	
	// 회원목록
	public List<UserDto> getList();
	
	// 등급수정

	public int updateGrade(@Param("user_id") String user_id , @Param("grade") String grade);
	
	// 데이터 1개
	public UserDto selectById(String user_id);

}
