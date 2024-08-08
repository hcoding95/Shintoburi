package com.kh.sintoburi.hn;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.sintoburi.domain.hn.EnquiryVo;
import com.kh.sintoburi.domain.hn.ReplyVo;
import com.kh.sintoburi.mapper.hn.EnquiryMapper;
import com.kh.sintoburi.mapper.hn.ReplyMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class mapperTest {

	@Autowired
	private EnquiryMapper enquiryMapper;
	
	@Autowired
	private ReplyMapper replyMapper;
	
	@Test
	public void testInstance() {
		log.info("enquiryMapper:" + enquiryMapper);
	}
	
	@Test
	public void selectByEno() {
		EnquiryVo vo = enquiryMapper.selectByEno(1);
		log.info(vo);
	}
	 @Test
	    public void insertReply() {
	        ReplyVo vo = ReplyVo.builder()
	            .eno(1)
	            .user_id("user02")
	            .reply_content("답변")
	            .manager_id("manager")
	            .build();
	        
	        int count = replyMapper.insertReply(vo);
	        log.info("Rows inserted: " + count);
	        log.info(vo.toString());
	    }
	 
	 @Test
	 public void goodsselect() {
		 List<EnquiryVo> list = enquiryMapper.goodsGetList();
		 log.info(list);
	 }
	 
	 @Test
	 public void gradeSelect() {
		 List<EnquiryVo> list = enquiryMapper.gradeGetList();
		 log.info(list);
	 }
}
