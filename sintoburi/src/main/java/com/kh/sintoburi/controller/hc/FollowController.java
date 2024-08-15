package com.kh.sintoburi.controller.hc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.sintoburi.domain.hc.FollowDto;
import com.kh.sintoburi.service.hc.FollowService;

@RestController
@RequestMapping("/hc/follow/*")
public class FollowController {
	
	@Autowired
	private FollowService followService;
	
	@PostMapping("/addFollow")
	public boolean addFollow (@RequestBody FollowDto followDto) {
		return followService.addFollow(followDto);
	}
	
	@PostMapping("/removeFollow")
	public boolean removeFollow (@RequestBody FollowDto followDto) {
		return followService.removeFollow(followDto);
	}
	
	@PostMapping("/getSumFollow")
	public int getSumFollow (String follow_id) {
		int sumFollow = followService.getCountFollower(follow_id);
		return sumFollow;
	}
}
