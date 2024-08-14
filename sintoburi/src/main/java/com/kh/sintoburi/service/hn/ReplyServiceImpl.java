package com.kh.sintoburi.service.hn;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.hn.ReplyVo;
import com.kh.sintoburi.mapper.hn.EnquiryReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private EnquiryReplyMapper replyMapper;
	
	// 답변 등록
	@Override
	public boolean insertReply(ReplyVo replyVo) {
		int count = replyMapper.insertReply(replyVo);
		return (count == 1 )? true : false;
	}

	@Override
	public List<ReplyVo> replyList() {
		List<ReplyVo> list = replyMapper.selectReply();
		return list;
	}

	@Override
	public ReplyVo selectByReplyEno(int eno) {
		ReplyVo vo = replyMapper.selectByReplyEno(eno);
		return vo;
	}

	
	
	
}
