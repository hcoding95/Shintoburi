package com.kh.sintoburi.hn;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.sintoburi.domain.hn.Criteria;
import com.kh.sintoburi.domain.hn.EnquiryVo;
import com.kh.sintoburi.domain.hn.FaqVo;
import com.kh.sintoburi.domain.hn.LoginDto;
import com.kh.sintoburi.domain.hn.NoticeVo;
import com.kh.sintoburi.domain.hn.PageDto;
import com.kh.sintoburi.domain.hn.ReplyVo;
import com.kh.sintoburi.domain.hn.ReportPostVo;
import com.kh.sintoburi.domain.hn.UserDto;
import com.kh.sintoburi.mapper.hn.EnquiryMapper;
import com.kh.sintoburi.mapper.hn.FaqMapper;
import com.kh.sintoburi.mapper.hn.NoticeMapper;
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

	@Autowired
	private NoticeMapper noticeMapper;
	
	@Autowired
	private FaqMapper faqMapper;

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
		ReplyVo vo = ReplyVo.builder().eno(1).user_id("user02").reply_content("답변").manager_id("manager").build();

		int count = replyMapper.insertReply(vo);
		log.info("Rows inserted: " + count);
		log.info(vo.toString());
	}

	@Test
	public void getList() {
		List<EnquiryVo> list = enquiryMapper.getList("user00");
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
	public void NoticeList() {
		List<NoticeVo> list = noticeMapper.selectNotice();
		log.info(list);
	}

	@Test
	public void enqMod() {
		EnquiryVo vo = EnquiryVo.builder()
				.user_id("user00")
				.enquiry_type("상품문의")
				.content("상품문의 - 수정완료")
				.image("enquiry")
				.eno(30).build();

		int count = enquiryMapper.update(vo);
		log.info(count);
	}
	
	@Test
	public void managerList() {
		List<UserDto> list = userMapper.managerList();
		log.info(list);
	}
	
	@Test
	public void selectById() {
		String user_id = "user00";
		UserDto dto = userMapper.selectById(user_id);
		log.info(dto);
	}
	
	@Test
	public void userList() {
	List<UserDto> list = userMapper.getList();
		log.info(list);
	}
	
	
	@Test
	public void faqList() {
		List<FaqVo> list = faqMapper.selectFaq();
		log.info(list);
	}

	@Test
	public void noticeMod() {
		NoticeVo noticeVo = NoticeVo.builder()
				.n_no(30)
				.title("dd-수정")
				.content("수정완료")
				.build();
	int count =	noticeMapper.updateNotice(noticeVo);
	log.info(count);
	}
	

}
