package com.kh.sintoburi.mapper.gr;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.sintoburi.domain.gr.OrderDto;

public interface SalesManageMapper {
	public List<OrderDto> getSalesManageList();

	public int updateDeliveryStatus(@Param("ono") int ono, @Param("delivery_status") String delivery_status);

}
