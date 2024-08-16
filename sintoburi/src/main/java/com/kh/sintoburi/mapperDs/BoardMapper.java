package com.kh.sintoburi.mapperDs;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.sintoburi.domainDs.BoardVo;

public interface BoardMapper {
	
	// 글 상세보기
	@Select("select * from tbl_board where bno=#{bno}")
	public BoardVo selectByBno(Long bno);
	// 리스트 가져오기
	@Select("select * from tbl_board order by bno desc")
	public List<BoardVo> selectList();
	// 게시글 쓰기
	public Integer insert(BoardVo vo);
	// 게시글 삭제
	public Integer delete(Long bno);
	//게시글 수정
	public Integer update(BoardVo vo);
	
	
}
