package com.kh.sintoburi.mapper.hn;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.sintoburi.domain.hn.ReplyVo;

public interface EnquiryReplyMapper {
	
	// 문의사항 답변 등록
	public int insertReply(ReplyVo replyVo);
	
	// 문의사항 답변 목록
	public List<ReplyVo> selectReply();
	
	// 답변 데이터 1개 
	public ReplyVo selectByReplyEno(@Param("eno")  int eno);
}
