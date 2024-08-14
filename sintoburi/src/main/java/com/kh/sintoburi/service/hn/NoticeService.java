package com.kh.sintoburi.service.hn;

import java.util.List;

import com.kh.sintoburi.domain.hn.NoticeVo;

public interface NoticeService {
	// 공지사항 목록
	public List<NoticeVo> getListNotice();

	// 공지사항 한개데이터
	public NoticeVo selectByNno(int n_no);

	// 공지사항 등록
	public boolean registerNotice(NoticeVo noticeVo);

	// 공지사항 수정
	public boolean modifyNotice(NoticeVo noticeVo);

	// 공지사항 삭제
	public boolean removeNotice(int n_no);
}
