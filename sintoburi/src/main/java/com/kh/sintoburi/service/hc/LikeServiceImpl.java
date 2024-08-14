package com.kh.sintoburi.service.hc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.hc.LikeDto;
import com.kh.sintoburi.mapper.hc.LikeMapper;

@Service
public class LikeServiceImpl implements LikeService {
	
	@Autowired
	private LikeMapper likeMapper;
	

	@Override
	public int getLikeCount(int blog_no) {
		int sumLike = likeMapper.getLikeCount(blog_no);
		return sumLike;
	}

	@Override
	public boolean isCheckLike(LikeDto likeDto) {
		LikeDto like = likeMapper.isCheckLike(likeDto);
		if(like != null) {
			return true;
		}
		return false;
	}

	@Override
	public boolean addLike(LikeDto likeDto) {
		int count = likeMapper.addLike(likeDto);
		return (count > 0)? true : false;
	}

	@Override
	public boolean removeLike(LikeDto likeDto) {
		int count = likeMapper.removeLike(likeDto);
		return (count > 0)? true : false;
	}
	
}
