package com.kh.sintoburi.mapper.ji;

import java.util.List;

import com.kh.sintoburi.domain.ji.SuggestionVo;

public interface SuggestionMapper {
	
	public int insert(SuggestionVo vo);
	
	public SuggestionVo read(int suggestion_no);
	
	public int delete(int suggestion_no);
	
	public int update(SuggestionVo suggestionVo);
	
	public List<SuggestionVo> getList(int product_no);
}
