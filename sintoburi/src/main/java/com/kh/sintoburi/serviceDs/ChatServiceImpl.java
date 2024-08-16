package com.kh.sintoburi.serviceDs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domainDs.BoardVo;
import com.kh.sintoburi.domainDs.ChatVo;
import com.kh.sintoburi.domainDs.QuizVo;
import com.kh.sintoburi.mapperDs.BoardMapper;
import com.kh.sintoburi.mapperDs.ChatMapper;
import com.kh.sintoburi.mapperDs.QuizGameMapper;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	public ChatMapper chatMapper;

	@Override
	public boolean sendChat(ChatVo vo) {
		
		return chatMapper.insert(vo)>0?true:false;
	}

	
	
	
	
}
