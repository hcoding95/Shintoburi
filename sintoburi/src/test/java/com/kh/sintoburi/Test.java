package com.kh.sintoburi;


import java.util.List;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.sintoburi.domain.hc.ProductDto;
import com.kh.sintoburi.mapper.hc.ProductMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class Test {
	
	@Autowired
	private ProductMapper mapper;
	
	@org.junit.Test
	public void mapperTest() {
		ProductDto dto = new ProductDto();
		dto.setProduct_id(10);
		List<ProductDto> list = mapper.getProductListWithCondition(dto);
	}
	
	
	

	
}
