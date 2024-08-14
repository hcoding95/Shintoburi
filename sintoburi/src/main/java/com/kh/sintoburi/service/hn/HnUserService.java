package com.kh.sintoburi.service.hn;

import java.util.List;

import com.kh.sintoburi.domain.hn.HnCriteria;
import com.kh.sintoburi.domain.hn.HnLoginDto;
import com.kh.sintoburi.domain.hn.HnUserDto;

public interface HnUserService {

	// 회원목록
	public List<HnUserDto> getList(HnCriteria criteria);

	// 매니저목록
	public List<HnUserDto> managerList(HnCriteria criteria);

	// 회원 목록 갯수
	public int getTotal(HnCriteria criteria);
	
	// 매니저 목록 갯수
	public int managerTotalCount(HnCriteria criteria);

	// 등급수정
	public boolean modifyGrade(String user_id, String grade);

	// 데이터 1개
	public HnUserDto selectById(String user_id);

	// 로그인
	public HnUserDto login(HnLoginDto dto);

}
