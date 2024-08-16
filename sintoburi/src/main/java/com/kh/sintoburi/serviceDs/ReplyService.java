package com.kh.sintoburi.serviceDs;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.sintoburi.domainDs.BoardVo;
import com.kh.sintoburi.domainDs.ReplyVo;


public interface ReplyService {
	public boolean commitComment(ReplyVo vo);
	
	public List<ReplyVo> getReply(@Param("bno") Long bno);


}
