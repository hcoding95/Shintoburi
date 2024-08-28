package com.kh.sintoburi.service.gr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.gr.OrderDto;
import com.kh.sintoburi.mapper.gr.DeliveryMapper;

@Service
public class DeliveryServiceImpl implements DeliveryService{

	@Autowired
	private DeliveryMapper deliveryMapper;
	
	@Override
	public List<OrderDto> getDeliveryManageList() {
		List<OrderDto> list = deliveryMapper.getDeliveryManageList();
		return list;
	}

}
