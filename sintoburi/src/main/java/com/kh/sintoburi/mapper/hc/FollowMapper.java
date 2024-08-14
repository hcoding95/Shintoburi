package com.kh.sintoburi.mapper.hc;

import com.kh.sintoburi.domain.hc.FollowDto;

public interface FollowMapper {
	
	public int getFollowCount (String user_following);
	public int addFollow(FollowDto followDto);
	public int removeFollow(FollowDto followDto);
	public FollowDto isCheckFollow(FollowDto followDto);
	
	
}
