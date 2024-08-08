package com.kh.sintoburi.service.hn;

import com.kh.sintoburi.domain.hn.ReplyVo;

public interface ReplyService {

	// 문의사항 답변 등록
	public boolean insertReply(ReplyVo replyVo);
}
