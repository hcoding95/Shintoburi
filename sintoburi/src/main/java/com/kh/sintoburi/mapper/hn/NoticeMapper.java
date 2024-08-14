package com.kh.sintoburi.mapper.hn;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
}
