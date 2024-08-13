package com.kh.sintoburi.mapper.ji;

import java.util.List;

import com.kh.sintoburi.domain.ji.ProductVo;

public interface ProductMapper {

	// 상품 목록
	public List<ProductVo> getProducts();
	
	// 상품 추가
	public int insertProduct(ProductVo Vo);
	
	// 상품 추가 - 키
	public int insertSelectKey(ProductVo Vo);

	// 상품 삭제
	public int deleteProduct(Integer pno);

	// 상품 상세보기
	public ProductVo selectByPno(Integer pno);
	
	// 상품 카테고리별 가져오기
	public List<ProductVo> selectProductsByCate(int cateNo);
	
}
