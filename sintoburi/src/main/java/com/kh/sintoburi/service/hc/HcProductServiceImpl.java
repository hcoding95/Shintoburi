package com.kh.sintoburi.service.hc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.hc.HcProductTagDto;
import com.kh.sintoburi.mapper.hc.HcProductTagMapper;

@Service
public class HcProductServiceImpl implements HcProductService {
	
	@Autowired
	private HcProductTagMapper productMapper;
	
	@Override
	public List<HcProductTagDto> getProductList(HcProductTagDto dto) {
		List<HcProductTagDto> list = productMapper.getProductListWithCondition(dto);
		
		return list;
	}

}
