package com.kh.sintoburi.service.hn;

import java.util.List;

import com.kh.sintoburi.domain.hn.EnquiryVo;

public interface EnquiryService {

	public List<EnquiryVo> getList();
	
	public boolean register(EnquiryVo vo);
	
	public boolean modify(EnquiryVo vo);
	
	public boolean remove(int eno);
	
	public EnquiryVo selectByEno(int eno);
}
