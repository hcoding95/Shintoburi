package com.kh.sintoburi.controller.hn;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sintoburi.domain.hn.Criteria;
import com.kh.sintoburi.domain.hn.EnquiryVo;
import com.kh.sintoburi.domain.hn.NoticeVo;
import com.kh.sintoburi.domain.hn.PageDto;
import com.kh.sintoburi.domain.hn.ReplyVo;
import com.kh.sintoburi.domain.hn.ReportPostVo;
import com.kh.sintoburi.domain.hn.UserDto;
import com.kh.sintoburi.service.hn.EnquiryService;
import com.kh.sintoburi.service.hn.NoticeService;
import com.kh.sintoburi.service.hn.ReplyService;
import com.kh.sintoburi.service.hn.ReportPostService;
import com.kh.sintoburi.service.hn.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/hn/manager/*")
@Log4j
public class ManagerController {

	@Autowired
	private UserService userService;

	@Autowired
	private EnquiryService enquiryService;

	@Autowired
	private ReplyService replyService;

	@Autowired
	private ReportPostService reportPostService;

	@Autowired
	private NoticeService noticeService;

	// 회원리스트

	// 회원목록
	@GetMapping("/userList")
	public void userList(Model model, Criteria criteria) {
		System.out.println("Page Number: " + criteria.getPageNum());
		System.out.println("Amount per Page: " + criteria.getAmount());

		// 회원목록
		List<UserDto> list = userService.getList(criteria);
		int total = userService.getTotal(criteria);
		PageDto pageMaker = new PageDto(criteria, total);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("userList", list);

	}

	// 매니저목록
	@GetMapping("/managerList")
	public void managerList(Model model, Criteria criteria) {

		List<UserDto> managerList = userService.managerList(criteria);
		int managerTotal = userService.managerTotalCount(criteria);
		
		PageDto managerPageMaker = new PageDto(criteria, managerTotal);
		model.addAttribute("managerList", managerList);
		model.addAttribute("managerPageMaker", managerPageMaker);
	}

	// 등급수정
	@PostMapping("/modGrade")
	@ResponseBody
	public boolean modGrade(@RequestBody UserDto dto) {
		System.out.println("modGrade...");
		String user_id = dto.getUser_id();
		String grade = dto.getGrade();

		boolean result = userService.modifyGrade(user_id, grade);
		return result;
	}

	// 상품리스트

//	로그인한 유저 문의사항
//	@GetMapping("/enqList")
//	public void list(Model model) {
//		List<EnquiryVo> enquiryList = enquiryService.getList();
//		model.addAttribute("enquiryList", enquiryList);
//		// 답변 리스트
//		List<ReplyVo> replyLisy = replyService.replyList();
//		model.addAttribute("replyList", replyLisy);
//
//	}

	// 상품문의사항목록
	@GetMapping("/goodsEnqList")
	public void goodsEnqList(Model model, Criteria criteria) {
		List<EnquiryVo> list = enquiryService.goodsGetList(criteria);

		int total = enquiryService.getTotalCount(criteria);
		PageDto pageMaker = new PageDto(criteria, total);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("goodsEnqList", list);

		// 답변 리스트
		List<ReplyVo> replyLisy = replyService.replyList();
		model.addAttribute("replyList", replyLisy);
	}

	// 상품문의사항, 답변 상세보기
	@GetMapping("/enquiryDetail/{eno}")
	public String enquiryDetail(@PathVariable("eno") int eno, Model model) {
		System.out.println("enquiryDetail...");
		EnquiryVo enquiryVo = enquiryService.selectByEno(eno);
		model.addAttribute("enquiryVo", enquiryVo);

		ReplyVo replyVo = replyService.selectByReplyEno(eno);
		model.addAttribute("replyVo", replyVo);
		return "hn/manager/enquiryDetail";
	}

	// 상품 문의사항 답변완료 변경
	@PostMapping("/updateStatus")
	public ResponseEntity<String> updateStatus(@RequestParam int eno) {
		boolean result = enquiryService.updateStatus(eno);

		if (result) {
			return ResponseEntity.ok("문의사항 상태가 '답변완료'로 업데이트되었습니다.");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("문의사항 상태 업데이트에 실패했습니다.");
		}
	}

	// 등급리스트

	// 등급문의사항목록
	@GetMapping("/gradeEnqList")
	public void gradeEnqList(Model model, Criteria criteria) {
		List<EnquiryVo> list = enquiryService.gradeGetList(criteria);

		int total = enquiryService.getTotalCount(criteria);
		PageDto pageMaker = new PageDto(criteria, total);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("gradeEnqList", list);

		// 답변리스트
		List<ReplyVo> replyLisy = replyService.replyList();
		model.addAttribute("gradeReplyList", replyLisy);
	}

	// 등급문의사항, 답변 상세보기
	@GetMapping("/gradeEnqDetail/{eno}")
	public String gradeEnqDetail(@PathVariable("eno") int eno, Model model) {
		System.out.println("enquiryDetail...");
		EnquiryVo enquiryVo = enquiryService.selectByEno(eno);
		model.addAttribute("enquiryVo", enquiryVo);

		ReplyVo replyVo = replyService.selectByReplyEno(eno);
		model.addAttribute("replyVo", replyVo);
		return "hn/manager/gradeEnqDetail";
	}

	// 등급문의사항 답변완료 변경
	@PostMapping("/gradeupdateStatus")
	public ResponseEntity<String> gradeUpdateStatus(@RequestParam int eno) {
		boolean result = enquiryService.gradeUpdateStatus(eno);

		if (result) {
			return ResponseEntity.ok("문의사항 상태가 '처리완료'로 업데이트되었습니다.");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("문의사항 상태 업데이트에 실패했습니다.");
		}
	}

	// 신고게시글목록
	@GetMapping("/reportList")
	public void reportList(Model model, Criteria criteria) {
		List<ReportPostVo> list = reportPostService.ReportList(criteria);
		int total = reportPostService.getTotalCount(criteria);
		PageDto pageMaker = new PageDto(criteria, total);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("reportList", list);
	}

	// 신고게시글상세보기
	@GetMapping("/reportDetail/{re_no}")
	public String reportDetail(@PathVariable("re_no") int re_no, Model model) {

		ReportPostVo reportPostVo = reportPostService.selectByReNo(re_no);
		model.addAttribute("reportPostVo", reportPostVo);

		return "hn/manager/reportDetail";
	}

	// 공지사항
	@GetMapping("/noticeList")
	public void noticeList(Model model) {
		List<NoticeVo> list = noticeService.getListNotice();
		model.addAttribute("noticeList", list);
	}

	// 공지사항등록폼
	@GetMapping("/noticeForm")
	public void noticeForm() {

	}

	// 공지사항등록
	@PostMapping("/noticeRegister")
	public void noticeRegister() {

	}

	// 자주하는 질문
	@GetMapping("/questionList")
	public void questionList() {

	}

}
