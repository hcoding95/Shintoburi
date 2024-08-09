package com.kh.sintoburi.mapper.hn;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.sintoburi.domain.hn.ReportPostVo;

public interface ReportPostMapper {
	
	// 신고한 게시글 목록
	public List<ReportPostVo> selectReport ();

	
	// 신고한 게시글 1개
	public ReportPostVo selectByReNo(@Param("re_no") int re_no);
	
	
}
