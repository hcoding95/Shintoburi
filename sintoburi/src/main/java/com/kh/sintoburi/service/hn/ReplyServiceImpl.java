package com.kh.sintoburi.service.hn;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.hn.ReplyVo;
import com.kh.sintoburi.mapper.hn.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper replyMapper;
	
	// 답변 등록
	@Override
	public boolean insertReply(ReplyVo replyVo) {
		int count = replyMapper.insertReply(replyVo);
		return (count == 1 )? true : false;
	}

	
	
}
