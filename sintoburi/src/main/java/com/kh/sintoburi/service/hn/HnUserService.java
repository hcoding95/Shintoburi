package com.kh.sintoburi.service.hn;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.sintoburi.domain.hn.HnCriteria;
import com.kh.sintoburi.domain.hn.HnLoginDto;
import com.kh.sintoburi.domain.hn.HnUserDto;
import com.kh.sintoburi.domain.hn.HnUserVo;

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
	public HnUserVo selectById(String user_id);

	// 로그인
	public HnUserDto login(HnLoginDto dto);

	// 사업자번호 업데이트
	public boolean modifyBusinessNum(String user_id, String business_num);

	// 등급 처리완료시 business 1로업데이트
	public boolean updateBusiness(String user_id);

	// 등급 변경 해야하는 회원 리스트
	public List<HnUserDto> gradeChangeList();

}
