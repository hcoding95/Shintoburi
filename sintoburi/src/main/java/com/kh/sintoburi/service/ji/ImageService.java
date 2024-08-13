package com.kh.sintoburi.service.ji;

import java.util.List;

import com.kh.sintoburi.domain.ji.ImageVo;

public interface ImageService {
	
	// 상품 사진 등록
	public boolean saveImage(ImageVo image); 

	// 상품 사진 하나 가져오기
	public ImageVo getImageByProductNo(int pno);
	
	// 상품 상세보기 테스트
	public List<ImageVo> getImgList(int pno);
}
