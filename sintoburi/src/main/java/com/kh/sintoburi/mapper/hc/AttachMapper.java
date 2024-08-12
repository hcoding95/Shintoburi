package com.kh.sintoburi.mapper.hc;

import java.util.List;

import com.kh.sintoburi.domain.hc.AttachFileDto;


public interface AttachMapper {

	public int insert(AttachFileDto dto);
	
	public List<AttachFileDto> getAttachList(int blog_no);
	
	public int update(AttachFileDto dto);
	
	public int deleteAll(int blog_no);
	
	public int deleteByUuid(String uuid);
	
	public List<AttachFileDto> getOldAttachList();
	
}
