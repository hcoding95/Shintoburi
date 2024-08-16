package com.kh.sintoburi.serviceDs;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.kh.sintoburi.domainDs.BoardVo;
import com.kh.sintoburi.domainDs.QuizVo;


public interface GameService {
	// 퀴즈 게임 기록 등록
	public boolean recoardQuiz(QuizVo vo);
	
	// 퀴즈 게임 점수 구하기
	public List<QuizVo> getScore();

}
