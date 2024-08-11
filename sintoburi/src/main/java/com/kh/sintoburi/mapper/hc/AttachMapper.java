package com.kh.sintoburi.mapper.hc;

import java.util.List;

import com.kh.sintoburi.domain.hc.AttachFileDto;


public interface AttachMapper {

	public int insert(AttachFileDto dto);
	
	public List<AttachFileDto> getAttachList(int blog_no);
	
	public int delete(int blog_no);
	
	public List<AttachFileDto> getOldAttachList();
	
}
