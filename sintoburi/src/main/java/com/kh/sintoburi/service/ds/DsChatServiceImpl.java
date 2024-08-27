package com.kh.sintoburi.service.ds;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.ds.DsBoardVo;
import com.kh.sintoburi.domain.ds.DsChatVo;
import com.kh.sintoburi.domain.ds.DsQuizVo;
import com.kh.sintoburi.mapper.ds.DsBoardMapper;
import com.kh.sintoburi.mapper.ds.DsChatMapper;
import com.kh.sintoburi.mapper.ds.DsQuizGameMapper;

@Service
public class DsChatServiceImpl implements DsChatService {

	@Autowired
	public DsChatMapper chatMapper;

	@Override
	public boolean sendChat(DsChatVo vo) {
		
		return chatMapper.insert(vo)>0?true:false;
	}

	@Override
	public List<DsChatVo> getChatLog() {
		
		return chatMapper.selectList();
	}

	@Override
	public boolean deleteChatLog() {
		// TODO Auto-generated method stub
		return chatMapper.delete()>0?true:false;
	}

	
	
	
	
}
