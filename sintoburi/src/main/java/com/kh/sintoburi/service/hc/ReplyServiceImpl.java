package com.kh.sintoburi.service.hc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.sintoburi.domain.hc.ReplyDto;
import com.kh.sintoburi.mapper.hc.ReplyMapper;

public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyMapper replyMapper;

	@Override
	public List<ReplyDto> getReplyListByBlog_no(int blog_no) {
		List<ReplyDto> list = replyMapper.getListByBlog_no(blog_no);
		return list;
	}

	@Override
	public boolean insertReply(ReplyDto replyDto) {
		int count = replyDto.insertReply(replyDto);
		return false;
	}
	
	
	

}
