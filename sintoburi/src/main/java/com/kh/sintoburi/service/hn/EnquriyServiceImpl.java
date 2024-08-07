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

	@Override
	public List<EnquiryVo> getList() {
		List<EnquiryVo> list = enquiryMapper.getList();
		return list;
	}

	@Override
	public boolean register(EnquiryVo vo) {
		int count = enquiryMapper.insert(vo);
		return (count ==1)? true: false;
	}
	

	@Override
	public boolean modify(EnquiryVo vo) {
		int count = enquiryMapper.update(vo);
		return (count ==1)? true: false;
	}

	@Override
	public boolean remove(int eno) {
		int count = enquiryMapper.delete(eno);
		return (count ==1)? true: false;
	}

	@Override
	public EnquiryVo selectByEno(int eno) {
		EnquiryVo vo = enquiryMapper.selectByEno(eno);
		return vo;
	}
	
	
}
