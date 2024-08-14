package com.kh.sintoburi.mapper.hc;

import com.kh.sintoburi.domain.hc.LikeDto;

public interface LikeMapper {
	
	public int getLikeCount (int blog_no);
	public int addLike(LikeDto likeDto);
	public int removeLike(LikeDto likeDto);
	public LikeDto isCheckLike(LikeDto likeDto);
}
