package com.kh.sintoburi.service.gr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.gr.OrderDto;
import com.kh.sintoburi.mapper.gr.SalesManageMapper;

@Service
public class SalesManageServiceImpl implements SalesManageService{

	@Autowired
	private SalesManageMapper salesManageMapper;
	
	@Override
	public List<OrderDto> getSalesManageList() {
		List<OrderDto> list = salesManageMapper.getSalesManageList();
		return list;
	}

//	@Override
//	public boolean updateDeliveryStatus(int ono, String delivery_status) {
//		int count = salesManageMapper.updateDeliveryStatus(ono, delivery_status);
//		return (count == 1)? true: false;
//	}

}
