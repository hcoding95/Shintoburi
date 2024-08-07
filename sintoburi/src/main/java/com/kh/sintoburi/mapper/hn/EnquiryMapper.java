package com.kh.sintoburi.mapper.hn;

import java.util.List;

import com.kh.sintoburi.domain.hn.EnquiryVo;

public interface EnquiryMapper {
	
	public List<EnquiryVo> getList();
	
	public int insert(EnquiryVo vo);
	
	public int update(EnquiryVo vo);
	
	public int delete(int eno);
	
	public EnquiryVo selectByEno(int eno);

}
