package com.kh.sintoburi.serviceDs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domainDs.ReplyVo;
import com.kh.sintoburi.mapperDs.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper replyMapper;

	@Override
	public boolean commitComment(ReplyVo vo) {
		
		return replyMapper.insert(vo)>0?true:false;
	}

	@Override
	public List<ReplyVo> getReply(Long bno) {
		
		return replyMapper.selectByBno(bno);
	}
	
	
	
}
