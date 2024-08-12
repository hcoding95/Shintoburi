package com.kh.sintoburi.hn;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.sintoburi.domain.hn.Criteria;
import com.kh.sintoburi.domain.hn.EnquiryVo;
import com.kh.sintoburi.domain.hn.LoginDto;
import com.kh.sintoburi.domain.hn.PageDto;
import com.kh.sintoburi.domain.hn.ReplyVo;
import com.kh.sintoburi.domain.hn.ReportPostVo;
import com.kh.sintoburi.domain.hn.UserDto;
import com.kh.sintoburi.mapper.hn.EnquiryMapper;
import com.kh.sintoburi.mapper.hn.ReplyMapper;
import com.kh.sintoburi.mapper.hn.ReportPostMapper;
import com.kh.sintoburi.mapper.hn.UserMapper;
import com.kh.sintoburi.service.hn.UserService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class mapperTest {

	@Autowired
	private EnquiryMapper enquiryMapper;
	
	@Autowired
	private ReplyMapper replyMapper;
	
	@Autowired
	private ReportPostMapper reportPostMapper; 
	
	@Autowired
	private UserMapper userMapper;
	
	
	
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
	 public void getList() {
		 List<EnquiryVo>list = enquiryMapper.getList("user00");
		 log.info(list);
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
	 
	 @Test
	 public void updateStatus() {
		 int eno = 1;
		 int count = enquiryMapper.updateStatus(eno);
		 log.info(count);
	 }
	 
	 @Test
	 public void selectReply() {
		 List<ReplyVo> list = replyMapper.selectReply();
		 log.info(list);
	 }
	 
	 @Test
	 public void selectByReplyEno() {
		 int eno = 2;
		 ReplyVo vo = replyMapper.selectByReplyEno(eno);
		 log.info(vo);
	 
	 }
	 
	 @Test
	 public void gradeUpdateStatus() {
		 int count = enquiryMapper.gradeUpdateStatus(23);
		 log.info(count);
	 }
	 
	 @Test
	 public void selectReportPost() {
		List<ReportPostVo> list = reportPostMapper.selectReport();
		log.info(list);
	 }
	 
	 @Test
	 public void selectByReNo() {
		 ReportPostVo vo = reportPostMapper.selectByReNo(2);
			log.info(vo);
	 }
	 
	 @Test
	 public void login() {
		 LoginDto dto = new LoginDto();
		 dto.setUser_id("user00");
		 dto.setUser_pw("user00");
		 userMapper.login(dto);
	 }
	 
	 @Test
	 public void goodsList() {
		 List<EnquiryVo> list = enquiryMapper.goodsGetList();
		 log.info(list);
	 }
	 
	 @Test
	 public void getListCount( ) {
	
	 }
}
