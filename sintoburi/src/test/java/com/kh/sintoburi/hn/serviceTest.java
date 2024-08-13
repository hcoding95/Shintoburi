package com.kh.sintoburi.hn;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.sintoburi.domain.hn.EnquiryVo;
import com.kh.sintoburi.service.hn.EnquiryService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class serviceTest {
	
	@Autowired
	private EnquiryService enquiryService;
	
	@Test
	public void testInstance() {
		log.info("enquiryService:" + enquiryService);
	}
	
	@Test
	public void enqMod() {
		EnquiryVo vo = EnquiryVo.builder()
				.user_id("user00")
				.enquiry_type("상품문의")
				.content("상품문의 - 수정완료1")
				.image("enquiry")
				.eno(30).build();

		boolean result = enquiryService.modify(vo);
		log.info(result);
	}

}
