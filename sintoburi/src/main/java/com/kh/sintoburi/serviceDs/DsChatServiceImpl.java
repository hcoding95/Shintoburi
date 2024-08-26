package com.kh.sintoburi.serviceDs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domainDs.DsBoardVo;
import com.kh.sintoburi.domainDs.DsChatVo;
import com.kh.sintoburi.domainDs.DsQuizVo;
import com.kh.sintoburi.mapperDs.DsBoardMapper;
import com.kh.sintoburi.mapperDs.DsChatMapper;
import com.kh.sintoburi.mapperDs.DsQuizGameMapper;

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
