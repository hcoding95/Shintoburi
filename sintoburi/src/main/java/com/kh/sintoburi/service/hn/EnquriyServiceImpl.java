package com.kh.sintoburi.service.hn;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.hn.EnquiryVo;
import com.kh.sintoburi.mapper.hn.EnquiryMapper;

@Service
public class EnquriyServiceImpl implements EnquiryService{

	@Autowired
	private EnquiryMapper enquiryMapper;

	// 문의사항목록
	@Override
	public List<EnquiryVo> getList() {
		List<EnquiryVo> list = enquiryMapper.getList();
		return list;
	}

	// 문의사항등록
	@Override
	public boolean register(EnquiryVo vo) {
		int count = enquiryMapper.insert(vo);
		return (count ==1)? true: false;
	}
	
	
	// 문의사항수정
	@Override
	public boolean modify(int eno) {
		int count = enquiryMapper.update(eno);
		return (count == 1)? true: false;
	}

	//문의사항삭제
	@Override
	public boolean remove(int eno) {
		int count = enquiryMapper.delete(eno);
		return (count ==1)? true: false;
	}

	//문의사항데이터1개
	@Override
	public EnquiryVo selectByEno(int eno) {
		EnquiryVo vo = enquiryMapper.selectByEno(eno);
		return vo;
	}
	
	
}
