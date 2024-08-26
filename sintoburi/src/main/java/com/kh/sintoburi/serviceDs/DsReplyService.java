package com.kh.sintoburi.serviceDs;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.sintoburi.domainDs.DsBoardVo;
import com.kh.sintoburi.domainDs.DsReplyVo;


public interface DsReplyService {
	public boolean commitComment(DsReplyVo vo);
	
	public List<DsReplyVo> getReply(@Param("bno") Long bno);
	
	public boolean delReply(Long rno);
	public boolean modReply(DsReplyVo vo);

}
