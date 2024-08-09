package com.kh.sintoburi.service.hn;

import java.util.List;

import com.kh.sintoburi.domain.hn.ReportPostVo;

public interface ReportPostService {

	// 신고한 게시글 목록
	public List<ReportPostVo> ReportList();

	// 신고한 게시글 1개
	public ReportPostVo selectByReNo(int re_no);

}
