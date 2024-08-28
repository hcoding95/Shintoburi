package com.kh.sintoburi.gr.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.sintoburi.domain.gr.OrderDto;
import com.kh.sintoburi.service.gr.DeliveryService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DeliveryServiceTests {
	
	@Autowired
	public DeliveryService deliveryService;
	
	@Test
	public void testGetDeliveryManageList() {
		List<OrderDto> list = deliveryService.getDeliveryManageList();
		log.info(list);
	}
	
	
}
