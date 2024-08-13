package com.kh.sintoburi.mapper.hc;

import java.util.List;

import com.kh.sintoburi.domain.hc.AttachFileDto;
import com.kh.sintoburi.domain.hc.ProductTagDto;

public interface ProductTagMapper {
	
	public int insert(ProductTagDto tagDto);
	public int update(ProductTagDto tagDto);
	public int deleteByPrimaryKey(ProductTagDto tagDto);
	public List<ProductTagDto> getTagList(int blog_no);
	
	public List<ProductTagDto> getProductListWithCondition(ProductTagDto dto);
}
