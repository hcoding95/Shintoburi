package com.kh.sintoburi.controller.hc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.sintoburi.domain.hc.BlogSettingVo;
import com.kh.sintoburi.service.hc.BlogSettingService;

@RestController
@RequestMapping("/blogSetting/*")
public class BlogSettingController {
	
	@Autowired
	private BlogSettingService blogSettingService;
	
	
	@PostMapping("/insert")
	public boolean insert(@RequestBody BlogSettingVo vo) {
		return blogSettingService.insertSetting(vo);
	}
	
	@PostMapping("/update")
	public boolean update(@RequestBody BlogSettingVo vo) {
		return blogSettingService.modifySetting(vo);
	}
	
	@PostMapping("/delete")
	public boolean delete(@RequestBody BlogSettingVo vo) {
		return blogSettingService.deleteSetting(vo);
	}

}
