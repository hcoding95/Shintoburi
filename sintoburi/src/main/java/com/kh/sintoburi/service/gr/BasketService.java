package com.kh.sintoburi.service.gr;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.sintoburi.domain.gr.BasketDetailDto;
import com.kh.sintoburi.domain.gr.BasketDetailVo;
import com.kh.sintoburi.domain.gr.BasketVo;

public interface BasketService {
	//목록 검색
	public List<BasketDetailDto> getList(String user_id);
	
	//장바구니 키
	public boolean basketKey(BasketVo basketVo);
	
	//장바구니 넣기
	public boolean putBasket(BasketDetailVo detailVo);
	
	//장바구니 번호 확인
	public int IsBasket(String user_id);
	
	//장바구니에서 수정갯수 수정 (0 -> 제거)
	public boolean modifyCount(int p_count, int bdno);
	
	//장바구니 상세번호에서 삭제 장바구니 상세에서 상품 제거 - 1개씩 제거
	public boolean removeOne(int bdno);
	
	//장바구니 비우기 - 장바구니 상세에 있는 상품들 모두 제거 -> 장바구니 제거
	public boolean removeAll(int pno);
	
	//장바구니 상세보기
}
