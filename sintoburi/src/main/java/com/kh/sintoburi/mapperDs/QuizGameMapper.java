package com.kh.sintoburi.mapperDs;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.kh.sintoburi.domainDs.QuizVo;

public interface QuizGameMapper {
	
	// 기록등록
	public Integer insert(QuizVo vo);
	
	// 유저 랭킹 구하기(내림차순)
	@Select("select distinct * from tbl_quiz order by score desc")
	public List<QuizVo> selectRanking();
	
}
