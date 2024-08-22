package com.kh.sintoburi.service.hn;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.sintoburi.domain.hn.HnCriteria;
import com.kh.sintoburi.domain.hn.NoticeVo;

public interface NoticeService {
	// 공지사항 목록
	public List<NoticeVo> getListNotice(HnCriteria criteria);

	// 공지사항 게시글 갯수
	public int getTotalCount(HnCriteria criteria);

	// 공지사항 한개데이터
	public NoticeVo selectByNno(int n_no);

	// 공지사항 등록
	public int registerNotice(NoticeVo noticeVo);

	// 공지사항 수정
	public int modifyNotice(NoticeVo noticeVo);

	// 공지사항 삭제
	public boolean removeNotice(int n_no);

	// 이전게시글
	public NoticeVo getPreviousNotice(int n_no);

	// 다음 게시글
	public NoticeVo getNextNotice(int n_no);

	// 공지사항 항목 업데이트
	public boolean updateImportant(int n_no, String important);

	// 중요공지사항
	public NoticeVo importantNotice();

	// 선택 이미지 삭제
	public boolean choiceImageDelete(String uuid);
}
