package com.kh.sintoburi.service.ji;

import java.util.List;

import com.kh.sintoburi.domain.ji.ProductVo;

public interface ProductService {
	
	// 상품 목록
	public List<ProductVo> getProducts();

	// 상품 등록
	public Integer register(ProductVo vo);
	
	// 상품 상세보기
	public ProductVo getProductByNo(Integer pno);	
	
	// 상품 삭제
	public boolean remove(Integer pno);
	
//	// 상품 사진 등록
//	public boolean saveImage(ImageVo image); 
//
//	// 상품 사진 하나 가져오기
//	public ImageVo getImageByProductNo(int pno);

	// 카테고리별 상품 가져오기
	public List<ProductVo> selectProductsByCate(int cate_no);

}
