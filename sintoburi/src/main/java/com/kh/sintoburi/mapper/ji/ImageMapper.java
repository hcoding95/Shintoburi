package com.kh.sintoburi.mapper.ji;

import java.util.List;

import com.kh.sintoburi.domain.ji.ImageVo;

public interface ImageMapper {

	// 상품 이미지 등록
	public int insertImg(ImageVo vo);
	
	// 상품 이미지 리스트
	public List<ImageVo> getImgList(Integer rno);
	
	// 상품 상세보기 테스트
	public ImageVo getImageByProductNo(int pno);
}
