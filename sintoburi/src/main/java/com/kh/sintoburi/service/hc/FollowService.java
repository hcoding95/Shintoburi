package com.kh.sintoburi.service.hc;

import com.kh.sintoburi.domain.hc.FollowDto;

public interface FollowService {
	
	public int getLikeFollow(String user_following);
	public boolean isCheckFollow(FollowDto followDto);
	public boolean addFollow(FollowDto followDto);
	public boolean removeFollow(FollowDto followDto);
	
	

}
