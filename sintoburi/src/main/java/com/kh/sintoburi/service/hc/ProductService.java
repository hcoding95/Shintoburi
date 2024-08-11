package com.kh.sintoburi.service.hc;

import java.util.List;

import com.kh.sintoburi.domain.hc.ProductDto;

public interface ProductService {
	
	public List<ProductDto> getProductList(ProductDto dto);

}
