package com.kh.sintoburi.mapper.hc;

import java.util.List;

import com.kh.sintoburi.domain.hc.ProductDto;

public interface ProductMapper {
	public List<ProductDto> getProductListWithCondition(ProductDto dto);
}
