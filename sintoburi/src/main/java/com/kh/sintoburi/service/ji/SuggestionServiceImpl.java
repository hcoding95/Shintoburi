package com.kh.sintoburi.service.ji;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sintoburi.domain.ji.SuggestionVo;
import com.kh.sintoburi.mapper.ji.ProductMapper;
import com.kh.sintoburi.mapper.ji.SuggestionMapper;

@Service
public class SuggestionServiceImpl implements SuggestionService{

	@Autowired
	private SuggestionMapper suggMapper;
	
	@Autowired
	private ProductMapper prodMapper;
	
	// 문의사항 등록
	@Transactional
	@Override
	public boolean register(SuggestionVo suggestionVo) {

		// 상품 등록자와 유저 아이디가 같고, role_type이 "ANSWER"로 설정된 경우
	    String productOwner = prodMapper.getProductOwner(suggestionVo.getProduct_no());
	    if (suggestionVo.getRole_type().equals("ANSWER") && suggestionVo.getUser_id().equals(productOwner)) {
	        suggestionVo.setRole_type("ANSWER");
	    } else {
	        suggestionVo.setRole_type("QUESTION");
	    }

	    int count = suggMapper.insert(suggestionVo);
		
		return (count > 0) ? true : false;
	}

	
	@Override
	public SuggestionVo get(int suggestion_no) {
		SuggestionVo vo = suggMapper.read(suggestion_no);
		return vo;
	}

	// 문의사항 삭제
	@Override
	public boolean remove(int suggestion_no, int product_no) {
		int count = suggMapper.delete(suggestion_no);
		return (count > 0)? true : false;
	}
	
	// 문의사항 수정
	@Override
	public boolean modify(SuggestionVo suggestionVo) {
		int count = suggMapper.update(suggestionVo);
		return (count > 0) ? true : false;
	}

	// 문의사항 목록 가져오기
	@Override
	public List<SuggestionVo> getList(int product_no) {
		List<SuggestionVo> list = suggMapper.getList(product_no);
		return list;
	}
}
