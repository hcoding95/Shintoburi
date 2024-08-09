package com.kh.sintoburi.mapper.gr;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.sintoburi.domain.gr.BasketDetailDto;
import com.kh.sintoburi.domain.gr.BasketDetailVo;
import com.kh.sintoburi.domain.gr.BasketVo;



public interface BasketMapper {

	//목록 검색
	public List<BasketDetailDto> getList(@Param("user_id") String user_id);
	
	//장바구니 키
	public int insertSelectKey(BasketVo basketVo);
	
	//장바구니 넣기
	public int insertDetail(BasketDetailVo detailVo);
	
	//장바구니 개수 확인
	public int getBnoByUser(@Param("user_id") String user_id);
	
	//장바구니에서 수정갯수 수정 (0 -> 제거)
	public int update(@Param("p_count")int p_count, @Param("bdno") int bdno);
	
	//장바구니 상세번호에서 삭제 장바구니 상세에서 상품 제거 - 1개씩 제거
	public int delete(@Param("bdno") int bdno);
	
	//장바구니 비우기 - 장바구니 상세에 있는 상품들 모두 제거 -> 장바구니 제거
	public int deleteAll(@Param("bno") int bno);
	//장바구니 상세보기
	
}
