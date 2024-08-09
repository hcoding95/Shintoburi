package com.kh.sintoburi.service.hn;

import java.util.List;

import com.kh.sintoburi.domain.hn.EnquiryVo;

public interface EnquiryService {

	//전체
	public List<EnquiryVo> getList();
		
	
	// 상품문의사항목록
	public List<EnquiryVo> goodsGetList();

	// 등급문의사항
	public List<EnquiryVo> gradeGetList();

	// 문의사항등록
	public boolean register(EnquiryVo vo);

	// 문의사항수정
	public boolean modify(int eno);

	// 문의사항삭제
	public boolean remove(int eno);

	// 문의사항데이터1개
	public EnquiryVo selectByEno(int eno);
}
