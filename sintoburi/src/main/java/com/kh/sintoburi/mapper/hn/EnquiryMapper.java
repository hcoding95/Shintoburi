package com.kh.sintoburi.mapper.hn;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.sintoburi.domain.hn.Criteria;
import com.kh.sintoburi.domain.hn.EnquiryVo;

public interface EnquiryMapper {

	// 로그인 문의사항 목록
	public List<EnquiryVo> getList(@Param("user_id") String user_id);

	// 게시글 갯수
	public int getTotalCount(Criteria criteria);

	// 상품문의사항목록
	public List<EnquiryVo> goodsGetList();
	
	// 등급문의사항
	public List<EnquiryVo> gradeGetList();

	// 상품목록페이징
	public List<EnquiryVo> getGoodsWithPaging(Criteria criteria);
	
	// 등급목록페이징
	public List<EnquiryVo> getGradeWithPaging(Criteria criteria);
	
	// 문의사항등록
	public int insert(EnquiryVo vo);

	// 문의사항수정
	public int update(@Param("eno") int eno);

	// 문의사항삭제
	public int delete(@Param("eno") int eno);

	// 문의사항한개데이터
	public EnquiryVo selectByEno(@Param("eno") int eno);

	// 상품 문의사항 답변완료변경
	public int updateStatus(@Param("eno") int eno);

	// 등급 문의사항 처리완료
	public int gradeUpdateStatus(@Param("eno") int eno);
}
