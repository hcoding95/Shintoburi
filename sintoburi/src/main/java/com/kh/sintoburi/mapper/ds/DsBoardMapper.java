package com.kh.sintoburi.mapper.ds;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.sintoburi.domain.ds.DsBoardVo;

public interface DsBoardMapper {
	
	// 글 상세보기
	@Select("select * from tbl_board where bno=#{bno}")
	public DsBoardVo selectByBno(Long bno);
	// 리스트 가져오기
	@Select("select * from tbl_board order by bno desc")
	public List<DsBoardVo> selectList();
	// 게시글 쓰기
	public Integer insert(DsBoardVo vo);
	// 게시글 삭제
	public Integer delete(Long bno);
	// 게시글 수정
	public Integer update(DsBoardVo vo);
	// 조회수 증가
	public Integer updataViewCount(Long bno);
	

	
	
}
