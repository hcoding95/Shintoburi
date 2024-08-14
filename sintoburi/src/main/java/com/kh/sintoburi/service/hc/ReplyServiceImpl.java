package com.kh.sintoburi.service.hc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.hc.ReplyDto;
import com.kh.sintoburi.mapper.hc.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyMapper replyMapper;

	@Override
	public List<ReplyDto> getReplyListByBlog_no(int blog_no) {
		List<ReplyDto> list = replyMapper.getReplyListByBlog_no(blog_no);
		return list;
	}

	@Override
	public boolean insertReply(ReplyDto replyDto) {
		int count = replyMapper.insertReply(replyDto);
		return (count >0)? true : false;
	}

	@Override
	public boolean modifyReply(ReplyDto replyDto) {
		int count = replyMapper.modifyReply(replyDto);
		return (count >0)? true : false;
	}

	@Override
	public boolean deleteReply(int blog_rno) {
		int count = replyMapper.deleteByBlog_rno(blog_rno);
		return (count >0)? true : false;
	}
	
	
	

}
