package com.kh.sintoburi.service.ds;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.ds.DsReportVo;
import com.kh.sintoburi.mapper.ds.DsReportMapper;

@Service
public class DsReportServiceImpl implements DsReportService {

	@Autowired
	private DsReportMapper reportMapper;

	@Override
	public boolean addReport(DsReportVo vo) {
		
		return reportMapper.insert(vo)>0?true:false;
	}

	
	
	
	
}
