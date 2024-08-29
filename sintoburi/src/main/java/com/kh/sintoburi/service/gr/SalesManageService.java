package com.kh.sintoburi.service.gr;

import java.util.List;

import com.kh.sintoburi.domain.gr.OrderDto;

public interface SalesManageService {
	public List<OrderDto> getSalesManageList();
	
	//public boolean updateDeliveryStatus(int ono, String delivery_status);
}
