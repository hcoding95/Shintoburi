package com.kh.sintoburi.serviceDs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domainDs.BoardVo;
import com.kh.sintoburi.mapperDs.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	public BoardMapper boardMapper;
	
	
	@Override
	public boolean insertPost(BoardVo vo) {
		
		return boardMapper.insert(vo)==1?true:false;
	}


	@Override
	public List<BoardVo> getList() {
		List<BoardVo> list = boardMapper.selectList();
		return list;
	}


	@Override
	public BoardVo getDetail(Long bno) {
		// TODO Auto-generated method stub
		return boardMapper.selectByBno(bno);
	}


	@Override
	public boolean deletePost(Long bno) {
		
		return boardMapper.delete(bno) >0 ? true:false;
	}


	@Override
	public boolean updatePost(BoardVo vo) {
		return  boardMapper.update(vo)==1?true:false;
	}

}
