package com.kh.sintoburi.controller.hc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.sintoburi.domain.hc.LikeDto;
import com.kh.sintoburi.service.hc.LikeService;

@RestController
@RequestMapping("/hc/like/*")
public class LikeController {
	
	@Autowired
	private LikeService likeService;
	
	@PostMapping("/addLike")
	public boolean addLike(@RequestBody LikeDto likeDto) {
		return likeService.addLike(likeDto);
	}
	
	@PostMapping("/removeLike")
	public boolean removeLike(@RequestBody LikeDto likeDto) {
		return likeService.removeLike(likeDto);
	}
	
	@PostMapping("/getSumLike")
	public int getSumLike(int blog_no) {
		int sumLike = likeService.getLikeCount(blog_no);
		return sumLike;
	}

}
