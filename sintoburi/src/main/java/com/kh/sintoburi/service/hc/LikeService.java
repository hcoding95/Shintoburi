package com.kh.sintoburi.service.hc;

import com.kh.sintoburi.domain.hc.LikeDto;

public interface LikeService {
	
	public int getLikeCount(int blog_no);
	public boolean isCheckLike(LikeDto likeDto);
	public boolean addLike(LikeDto likeDto);
	public boolean removeLike(LikeDto likeDto);

}
