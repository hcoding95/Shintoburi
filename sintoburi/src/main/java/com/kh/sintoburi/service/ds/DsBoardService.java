package com.kh.sintoburi.service.ds;

import java.util.List;

import com.kh.sintoburi.domain.ds.DsBoardVo;


public interface DsBoardService {
	public DsBoardVo getDetail(Long bno);
	public boolean insertPost(DsBoardVo vo);
	public boolean updatePost(DsBoardVo vo);
	public List<DsBoardVo> getList();
	public boolean deletePost(Long bno);
	public boolean upViewCount(Long bno);
}
