package com.kh.sintoburi.service.hc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.hc.BlogSettingVo;
import com.kh.sintoburi.mapper.hc.BlogSettingMapper;

@Service
public class BlogSettingServiceImpl implements BlogSettingService {
	@Autowired
	private BlogSettingMapper blogSettingMapper;
	
	@Override
	public List<BlogSettingVo> getSettingList(String user_id) {
		List<BlogSettingVo> list = blogSettingMapper.getBlogSettingList(user_id);
		return list;
	}

	@Override
	public boolean insertSetting(BlogSettingVo settingVo) {
		int count = blogSettingMapper.insertSetting(settingVo);
		return (count > 0)? true : false;
	}

	@Override
	public boolean modifySetting(BlogSettingVo settingVo) {
		int count = blogSettingMapper.modifySetting(settingVo);
		return (count > 0)? true : false;
	}

	@Override
	public boolean deleteSetting(BlogSettingVo settingVo) {
		int count = blogSettingMapper.deleteSetting(settingVo);
		return (count > 0)? true : false;
	}

}
