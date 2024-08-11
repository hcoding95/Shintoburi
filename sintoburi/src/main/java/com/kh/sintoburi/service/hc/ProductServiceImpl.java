package com.kh.sintoburi.service.hc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.hc.ProductDto;
import com.kh.sintoburi.mapper.hc.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public List<ProductDto> getProductList(ProductDto dto) {
		List<ProductDto> list = productMapper.getProductListWithCondition(dto);
		return list;
	}

}
