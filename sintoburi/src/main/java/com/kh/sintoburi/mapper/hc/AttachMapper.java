package com.kh.sintoburi.mapper.hc;

import java.util.List;

import com.kh.sintoburi.domain.hc.AttachFileDto;


public interface AttachMapper {

	public int insert(AttachFileDto dto);
	
	public List<AttachFileDto> getAttachList(Long blogNo);
	
	public int delete(long blogNo);
	
	public List<AttachFileDto> getOldAttachList();
	
}
