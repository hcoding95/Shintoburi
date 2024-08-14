package com.kh.sintoburi.service.hn;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.hn.FaqVo;
import com.kh.sintoburi.mapper.hn.FaqMapper;

@Service
public class FaqServiceImpl implements FaqService{
	@Autowired
	private FaqMapper faqMapper;

	@Override
	public List<FaqVo> faqList() {
		List<FaqVo> list = faqMapper.selectFaq();
		return list;
	}

	@Override
	public boolean faqRegister(FaqVo faqVo) {
		int count = faqMapper.insertFaq(faqVo);
		return (count == 1)? true : false;
	}

	@Override
	public boolean faqModify(FaqVo faqVo) {
		int count = faqMapper.updateFaq(faqVo);
		return (count == 1)? true : false;
	}

	@Override
	public boolean faqRemove(int f_no) {
		int count =  faqMapper.deleteFaq(f_no);
		return (count == 1)? true : false;
	}

	@Override
	public FaqVo selectByFno(int f_no) {
		FaqVo faqVo = faqMapper.selectByFno(f_no);
		return faqVo;
	}

}
