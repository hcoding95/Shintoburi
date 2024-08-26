package com.kh.sintoburi.serviceDs;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.kh.sintoburi.domainDs.DsBoardVo;


public interface DsBoardService {
	public DsBoardVo getDetail(Long bno);
	public boolean insertPost(DsBoardVo vo);
	public boolean updatePost(DsBoardVo vo);
	public List<DsBoardVo> getList();
	public boolean deletePost(Long bno);
	public boolean upViewCount(Long bno);
}
