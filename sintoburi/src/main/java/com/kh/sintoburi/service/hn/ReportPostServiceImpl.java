package com.kh.sintoburi.service.hn;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.hn.ReportPostVo;
import com.kh.sintoburi.mapper.hn.ReportPostMapper;

@Service
public class ReportPostServiceImpl implements ReportPostService{
	
	@Autowired
	private ReportPostMapper reportPostMapper;

	@Override
	public List<ReportPostVo> ReportList() {
		List<ReportPostVo> list = reportPostMapper.selectReport();
		return list;
	}

	@Override
	public ReportPostVo selectByReNo(int re_no) {
		ReportPostVo vo =  reportPostMapper.selectByReNo(re_no);
		return vo;
	}



}
