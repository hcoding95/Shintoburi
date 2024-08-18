package com.kh.sintoburi.mapper.hc;

import java.util.List;

import com.kh.sintoburi.domain.hc.BlogSettingVo;

public interface BlogSettingMapper {
	
	public int insertSetting(BlogSettingVo vo);
	public List<BlogSettingVo> getBlogSettingList(String user_id);
	public int modifySetting(BlogSettingVo vo);
	public int deleteSetting(BlogSettingVo vo);
}
