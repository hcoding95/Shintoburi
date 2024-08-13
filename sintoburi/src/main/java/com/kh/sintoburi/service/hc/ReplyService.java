package com.kh.sintoburi.service.hc;

import java.util.List;

import com.kh.sintoburi.domain.hc.ReplyDto;

public interface ReplyService {

	public List<ReplyDto> getReplyListByBlog_no(int blog_no);
	public boolean insertReply(ReplyDto replyDto);
}
