package com.kh.sintoburi.service.gr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sintoburi.domain.gr.BasketDetailDto;
import com.kh.sintoburi.domain.gr.DeliveryDto;
import com.kh.sintoburi.domain.gr.OrderDetailDto;
import com.kh.sintoburi.domain.gr.OrderVo;
import com.kh.sintoburi.mapper.gr.BasketMapper;
import com.kh.sintoburi.mapper.gr.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	public OrderMapper orderMapper;
	
	@Autowired
	public BasketMapper basketMapper;
	
	@Transactional
	@Override
	public boolean runOrder(OrderVo orderVo, int[] bdnos) {
		// 주문에 추가
		int count = orderMapper.insert(orderVo);
		int ono = orderVo.getOno();
		
		if (count == 1) {
			// 주문 상세에 추가
			for(int bdno : bdnos) {
				BasketDetailDto dto = basketMapper.selectByBdno(bdno);
				int pno = dto.getPno();
				int p_count = dto.getP_count();
				OrderDetailDto orderDetailDto = new OrderDetailDto();
				orderDetailDto.setOno(ono);
				orderDetailDto.setPno(pno);
				orderDetailDto.setP_count(p_count);
				int subCount = orderMapper.insertDetail(orderDetailDto);
				count += subCount;
			}
			
			// 장바구니 상세에서 삭제
			for(int bdno : bdnos) {
				int subCount = basketMapper.delete(bdno);
				count += subCount;
			}
			count += orderMapper.updateDeliveryCharge(ono);
		}
		return (count == (bdnos.length * 2) + 2) ?  true : false;
	}
	
	@Override
	public DeliveryDto getDeliveryInfo(String user_id) {
		DeliveryDto dto = orderMapper.getDeliveryInfo(user_id);
		return dto;
	}
	
	@Override
	public List<OrderVo> getOrderList(String user_id) {
		List<OrderVo> list = orderMapper.getOrderList(user_id);
		return list;
	}

	@Override
	public List<OrderDetailDto> getDetailList(String user_id, int ono) {
		List<OrderDetailDto> detailList = orderMapper.getDetailList(user_id, ono);
		return detailList;
	}
}
