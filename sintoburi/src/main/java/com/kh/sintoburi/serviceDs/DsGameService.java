package com.kh.sintoburi.serviceDs;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.kh.sintoburi.domainDs.DsBoardVo;
import com.kh.sintoburi.domainDs.DsQuizVo;
import com.kh.sintoburi.domainDs.DsPointDto;


public interface DsGameService {
	// 퀴즈 게임 기록 등록
	public boolean recoardQuiz(DsQuizVo vo);
	
	// 퀴즈 게임 점수 구하기
	public List<DsQuizVo> getScore();
	
	// 퀴즈 게임 포인트 등록
	public boolean getPointQuiz(DsQuizVo vo);
	
	// 달리기 게임 결과
	public boolean resultRunGame(DsPointDto dto);

}
