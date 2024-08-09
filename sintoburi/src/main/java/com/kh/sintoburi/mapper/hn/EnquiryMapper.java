package com.kh.sintoburi.mapper.hn;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.sintoburi.domain.hn.EnquiryVo;

public interface EnquiryMapper {
	
	//전체
	public List<EnquiryVo> getList();
	
	// 상품문의사항목록
	public List<EnquiryVo> goodsGetList();
	
	// 등급문의사항
	public List<EnquiryVo> gradeGetList();
	
	// 문의사항등록
	public int insert(EnquiryVo vo);
	
	// 문의사항수정
	public int update(@Param("eno") int eno);
	
	// 문의사항삭제
	public int delete(@Param("eno")  int eno);
	
	// 문의사항한개데이터
	public EnquiryVo selectByEno(@Param("eno")  int eno);

}
