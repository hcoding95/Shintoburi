package com.kh.sintoburi.mapper.hc;

import java.util.List;

import com.kh.sintoburi.domain.hc.ReplyDto;


public interface ReplyMapper {

	public List<ReplyDto> getListByBlog_no(int blog_no);
	public int insertReply(ReplyDto replyDto);
	public int modifyReply(ReplyDto replyDto);
	public int deleteByBlog_rno(int blog_rno);
	
}
