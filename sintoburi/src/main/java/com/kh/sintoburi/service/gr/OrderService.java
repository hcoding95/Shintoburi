package com.kh.sintoburi.service.gr;

import java.util.List;

import com.kh.sintoburi.domain.gr.DeliveryDto;
import com.kh.sintoburi.domain.gr.OrderDetailDto;
import com.kh.sintoburi.domain.gr.OrderDto;
import com.kh.sintoburi.domain.gr.OrderVo;

public interface OrderService {
	
	//주문하기 생성, 주문상세 생성, 배송비 계산
	public boolean runOrder(OrderVo orderVo, int[] bdnos);
	
	//배송정보 입력
	public DeliveryDto getDeliveryInfo(String user_id);
	
	//주문정보 목록
	public List<OrderDto> getOrderList(String user_id, int ono);
	
	//주문상세 정보 목록(주문번호 누르면 주문상세로 이동)  
	public List<OrderDetailDto> getDetailList(String user_id, int ono);
	
}
