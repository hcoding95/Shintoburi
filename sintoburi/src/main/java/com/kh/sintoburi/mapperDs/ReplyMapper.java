package com.kh.sintoburi.mapperDs;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.kh.sintoburi.domainDs.ReplyVo;

public interface ReplyMapper {
	
	
	@Select("select *from tbl_reply where bno=#{bno} order by rno desc")
	public List<ReplyVo> selectByBno(Long bno);
	
	public Integer insert(ReplyVo vo);
	
	
	
}
