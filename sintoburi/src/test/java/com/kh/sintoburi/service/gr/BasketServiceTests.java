package com.kh.sintoburi.service.gr;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.sintoburi.domain.gr.BasketDetailDto;
import com.kh.sintoburi.domain.gr.BasketDetailVo;
import com.kh.sintoburi.domain.gr.BasketVo;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BasketServiceTests {
	
	@Autowired
	private BasketService basketService;
	
	@Test
	public void testGetList() {
		String user_id = "user01";
		List<BasketDetailDto> list = basketService.getList(user_id);
		log.info(list);
	}
	
	@Test
	public void testIsBasket() {
		String user_id ="user01";
		int bno = basketService.IsBasket(user_id);
		log.info("bno:"+ bno);
	}
	
	@Test
	public void testPutBasket() {
		String user_id = "user01";
		int bno = basketService.IsBasket(user_id);
		
		if (bno == 0) {
			BasketVo vo = new BasketVo();
			vo.setUser_id(user_id);
			basketService.basketKey(vo);
			bno = vo.getBno();
		}
		
		BasketDetailVo detailVo = new BasketDetailVo();
		detailVo.setPno(2);
		detailVo.setBno(bno);
		detailVo.setP_count(6);
		boolean result = basketService.putBasket(detailVo);
		log.info("result:" + result);
	}
	
	@Test
	public void testModifyCount() {
		int p_count = 0;
		int bdno = 3;
		
		if (p_count == 0) {
			boolean result = basketService.removeOne(bdno);
			log.info("result:" + result);
		} else {
			boolean result = basketService.modifyCount(p_count, bdno);
			log.info("result:" + result);
		}
		
	}
	
	@Test
	public void testRemoveOne() {
		int bdno = 3;
		boolean result = basketService.removeOne(bdno);
		log.info("result:" + result);
	}
	
	@Test
	public void testRemoveAll() {
		int bno = 8;
		boolean result = basketService.removeAll(bno);
		log.info("result:" + result);
	}
	
}
