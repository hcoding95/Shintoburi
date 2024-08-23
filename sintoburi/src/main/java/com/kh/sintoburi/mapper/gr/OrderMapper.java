package com.kh.sintoburi.mapper.gr;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.sintoburi.domain.gr.DeliveryDto;
import com.kh.sintoburi.domain.gr.OrderDetailDto;
import com.kh.sintoburi.domain.gr.OrderVo;

public interface OrderMapper {
 //주문하기 생성	
 public int insert(OrderVo orderVo);
 
 //배송정보 입력하기
 public DeliveryDto getDeliveryInfo(@Param("user_id") String user_id);
 public List<OrderVo> getOrderList(@Param("user_id") String user_id);
 public List<OrderDetailDto> getDetailList(@Param("user_id") String user_id,
		 @Param("ono") int ono);
 
 //결제하기
 public int payment(); 
 
 public int insertDetail(OrderDetailDto dto);
 
 public int updateDeliveryCharge(@Param("ono") int ono);
 public int updateupdateSumTotal(@Param("ono") int ono);
 public int updateupdateTotalOrder(@Param("ono") int ono);
 

}
