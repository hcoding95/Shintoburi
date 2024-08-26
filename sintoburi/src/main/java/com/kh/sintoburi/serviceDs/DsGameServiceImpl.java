package com.kh.sintoburi.serviceDs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domainDs.DsBoardVo;
import com.kh.sintoburi.domainDs.DsQuizVo;
import com.kh.sintoburi.domainDs.DsPointDto;
import com.kh.sintoburi.mapperDs.DsBoardMapper;
import com.kh.sintoburi.mapperDs.DsQuizGameMapper;
import com.kh.sintoburi.mapperDs.DsRunGameMapper;

@Service
public class DsGameServiceImpl implements DsGameService {

	@Autowired
	public DsQuizGameMapper quizGameMapper;
	
	@Autowired
	public DsRunGameMapper runGameMapper;

	@Override
	public boolean recoardQuiz(DsQuizVo vo) {
		
		return quizGameMapper.insert(vo)>0?true:false;
	}

	@Override
	public List<DsQuizVo> getScore() {
		// TODO Auto-generated method stub
		return quizGameMapper.selectRanking();
	}

	@Override
	public boolean resultRunGame(DsPointDto dto) {

		return runGameMapper.update(dto)>0?true:false;
	}

	@Override
	public boolean getPointQuiz(DsQuizVo vo) {
		
		return quizGameMapper.update(vo)>0?true:false;
	}
	
	
	
}
