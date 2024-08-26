package com.kh.sintoburi.mapper.gr;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.sintoburi.domain.gr.DeliveryDto;
import com.kh.sintoburi.domain.gr.OrderDetailDto;
import com.kh.sintoburi.domain.gr.OrderDto;
import com.kh.sintoburi.domain.gr.OrderVo;

public interface OrderMapper {
	
//주문하기 생성	
 public int insert(OrderVo orderVo);
 
//배송정보 입력하기
 public DeliveryDto getDeliveryInfo(@Param("user_id") String user_id);
 
 //배송료 계산(30000원 미만 3000원):(더 해야 함: 주문자와 수취인이 다를 경우 입력한 정보 저장하기)
 public int updateDeliveryCharge(@Param("ono") int ono);
 //public int updateUpdateSumTotal(@Param("ono") int ono);
 //public int updateUpdateTotalOrder(@Param("ono") int ono);
 
//주문정보 목록
 public List<OrderDto> getOrderList(@Param("user_id") String user_id,
		 @Param("ono") int ono);
 
//주문상세 생성
public int insertDetail(OrderDetailDto dto);
 
//주문상세 정보 목록(주문번호 누르면 주문상세로 이동)  
 public List<OrderDetailDto> getDetailList(@Param("user_id") String user_id,
		 @Param("ono") int ono);
 
 //결제하기(더 해야 함: 포인트 조회해서 가격(pay_amount)만큼 빼야 함)
 public int payment(); 

}
