package com.kh.sintoburi.mapper.hn;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.sintoburi.domain.hn.EnquiryImageVo;
import com.kh.sintoburi.domain.hn.NoticeImageVo;
import com.kh.sintoburi.domain.hn.NoticeVo;

public interface NoticeMapper {
	
	// 공지사항 목록
	public List<NoticeVo> selectNotice();
	
	// 공지사항 한개데이터
	public NoticeVo selectByNno(@Param("n_no") int n_no);
	
	// 공지사항 등록
	public int insertNotice(NoticeVo noticeVo);
	
	// 공지사항 수정
	public int updateNotice(NoticeVo noticeVo);
	
	// 공지사항 삭제
	public int deleteNotice(@Param("n_no") int n_no);
	
	// 이전게시글
	public NoticeVo getPreviousNotice(@Param("n_no") int n_no);
	
	// 다음 게시글
	public NoticeVo getNextNotice(@Param("n_no") int n_no);
	
	// 공지사항 항목 업데이트
	public int updateImportant(@Param("n_no") int n_no , @Param("important") String important);
	
	// 중요공지사항
	public NoticeVo importantNotice();
	
	// 첨부파일 등록
	public int imageInsert(NoticeImageVo noticeImageVo);

	// 해당 글 첨부파일 가져오기
	public List<NoticeImageVo> getImage(@Param("n_no") int n_no);

	// 삭제
	public int imageDelete(@Param("n_no") int n_no);
}
