package com.kh.sintoburi.mapper.hn;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.sintoburi.domain.hn.FaqVo;

public interface FaqMapper {
	// 자주하는 질문 목록
	public List<FaqVo> selectFaq();
	
	// 등록
	public int insertFaq(FaqVo faqVo);
	
	// 수정
	public int updateFaq(FaqVo faqVo);
	
	// 삭제
	public int deleteFaq(@Param("f_no") int f_no);
	
	// 데이터 1개
	public FaqVo selectByFno(@Param("f_no") int f_no);

}
