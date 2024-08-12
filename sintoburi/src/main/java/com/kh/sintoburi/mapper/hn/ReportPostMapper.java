package com.kh.sintoburi.mapper.hn;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.sintoburi.domain.hn.Criteria;
import com.kh.sintoburi.domain.hn.ReportPostVo;

public interface ReportPostMapper {
	
	// 신고한 게시글 목록
	public List<ReportPostVo> selectReport ();
	
	// 페이징처리
	public List<ReportPostVo> getListWithPaging(Criteria criteria);
	
	// 게시글 갯수
	public int getTotalCount(Criteria criteria);
	
	// 신고한 게시글 1개
	public ReportPostVo selectByReNo(@Param("re_no") int re_no);
	
	
}
