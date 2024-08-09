package com.kh.sintoburi.service.hn;

import java.util.List;

import com.kh.sintoburi.domain.hn.ReplyVo;

public interface ReplyService {

	// 문의사항 답변 등록
	public boolean insertReply(ReplyVo replyVo);

	// 문의사항 답변 목록
	public List<ReplyVo> replyList();

	// 답변 데이터 1개
	public ReplyVo selectByReplyEno(int eno);
}
