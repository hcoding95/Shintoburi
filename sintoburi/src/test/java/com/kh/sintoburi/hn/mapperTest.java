package com.kh.sintoburi.hn;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.sintoburi.domain.hn.EnquiryVo;
import com.kh.sintoburi.mapper.hn.EnquiryMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class mapperTest {

	@Autowired
	private EnquiryMapper enquiryMapper;
	
	@Test
	public void testInstance() {
		log.info("enquiryMapper:" + enquiryMapper);
	}
	
	@Test
	public void selectByEno() {
		EnquiryVo vo = enquiryMapper.selectByEno(1);
		log.info(vo);
	}
}
