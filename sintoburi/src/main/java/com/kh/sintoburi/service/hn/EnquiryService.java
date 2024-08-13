package com.kh.sintoburi.service.hn;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.sintoburi.domain.hn.Criteria;
import com.kh.sintoburi.domain.hn.EnquiryVo;

public interface EnquiryService {

	//로그인한사용자목록
	public List<EnquiryVo> getList(String user_id);
	
	// 갯수
	public int getTotalCount(Criteria criteria);
		
	// 상품문의사항목록
	public List<EnquiryVo> goodsGetList(Criteria criteria);

	// 등급문의사항
	public List<EnquiryVo> gradeGetList(Criteria criteria);

	// 문의사항등록
	public boolean register(EnquiryVo vo);

	// 문의사항수정
	public boolean modify(EnquiryVo vo);

	// 문의사항삭제
	public boolean remove(int eno);

	// 문의사항데이터1개
	public EnquiryVo selectByEno(int eno);
	

	// 문의사항 답변완료변경
	public boolean updateStatus(int eno);
	
	// 등급 문의사항 처리완료 
	public boolean gradeUpdateStatus(int eno);

}
