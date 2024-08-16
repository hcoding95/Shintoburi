package com.kh.sintoburi.serviceDs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domainDs.BoardVo;
import com.kh.sintoburi.domainDs.QuizVo;
import com.kh.sintoburi.mapperDs.BoardMapper;
import com.kh.sintoburi.mapperDs.QuizGameMapper;

@Service
public class GameServiceImpl implements GameService {

	@Autowired
	public QuizGameMapper quizGameMapper;

	@Override
	public boolean recoardQuiz(QuizVo vo) {
		
		return quizGameMapper.insert(vo)>0?true:false;
	}

	@Override
	public List<QuizVo> getScore() {
		// TODO Auto-generated method stub
		return quizGameMapper.selectRanking();
	}
	
	
	
}
