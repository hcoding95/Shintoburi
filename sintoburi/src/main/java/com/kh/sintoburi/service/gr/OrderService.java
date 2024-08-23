package com.kh.sintoburi.service.gr;

import java.util.List;

import com.kh.sintoburi.domain.gr.DeliveryDto;
import com.kh.sintoburi.domain.gr.OrderDetailDto;
import com.kh.sintoburi.domain.gr.OrderVo;

public interface OrderService {
	
	public boolean runOrder(OrderVo orderVo, int[] bdnos);
	public List<OrderVo> getOrderList(String user_id);
	public List<OrderDetailDto> getDetailList(String user_id, int ono);
	public DeliveryDto getDeliveryInfo(String user_id);
}
