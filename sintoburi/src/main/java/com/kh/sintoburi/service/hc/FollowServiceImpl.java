package com.kh.sintoburi.service.hc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.hc.FollowDto;
import com.kh.sintoburi.mapper.hc.FollowMapper;

@Service
public class FollowServiceImpl implements FollowService {
	
	@Autowired
	private FollowMapper followMapper;
	

	@Override
	public int getLikeFollow(String user_following) {
		int sumFollow = followMapper.getFollowCount(user_following);
		return sumFollow;
	}
	

	@Override
	public boolean isCheckFollow(FollowDto followDto) {
		FollowDto follow = followMapper.isCheckFollow(followDto);
		if(follow != null) {
			return true;
		}
		return false;
	}

	@Override
	public boolean addFollow(FollowDto followDto) {
		int count = followMapper.addFollow(followDto);
		return (count > 0)? true : false;
	}

	@Override
	public boolean removeFollow(FollowDto followDto) {
		int count = followMapper.removeFollow(followDto);
		return (count > 0)? true : false;
	}


	@Override
	public int getCountFollower(String user_id) {
		return followMapper.getFollowCount(user_id);
	}
	
}
