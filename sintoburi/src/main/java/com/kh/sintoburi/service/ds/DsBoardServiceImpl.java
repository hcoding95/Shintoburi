package com.kh.sintoburi.service.ds;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.ds.DsBoardVo;
import com.kh.sintoburi.mapper.ds.DsBoardMapper;

@Service
public class DsBoardServiceImpl implements DsBoardService {

	@Autowired
	public DsBoardMapper boardMapper;
	
	
	@Override
	public boolean insertPost(DsBoardVo vo) {
		
		return boardMapper.insert(vo)==1?true:false;
	}


	@Override
	public List<DsBoardVo> getList() {
		List<DsBoardVo> list = boardMapper.selectList();
		return list;
	}


	@Override
	public DsBoardVo getDetail(Long bno) {
		// TODO Auto-generated method stub
		return boardMapper.selectByBno(bno);
	}


	@Override
	public boolean deletePost(Long bno) {
		
		return boardMapper.delete(bno) >0 ? true:false;
	}


	@Override
	public boolean updatePost(DsBoardVo vo) {
		return  boardMapper.update(vo)==1?true:false;
	}


	@Override
	public boolean upViewCount(Long bno) {
		
		return boardMapper.updataViewCount(bno)>0?true:false;
	}

}
