package com.kh.sintoburi.service.hc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.hc.ProductTagDto;
import com.kh.sintoburi.mapper.hc.ProductTagMapper;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductTagMapper productMapper;
	
	@Override
	public List<ProductTagDto> getProductList(ProductTagDto dto) {
		List<ProductTagDto> list = productMapper.getProductListWithCondition(dto);
		
		return list;
	}

}
