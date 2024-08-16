package com.kh.sintoburi.serviceDs;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.kh.sintoburi.domainDs.BoardVo;


public interface BoardService {
	public BoardVo getDetail(Long bno);
	public boolean insertPost(BoardVo vo);
	public boolean updatePost(BoardVo vo);
	public List<BoardVo> getList();
	public boolean deletePost(Long bno);
}
