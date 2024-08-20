package com.kh.sintoburi.controller.hn;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.sintoburi.domain.hn.EnquiryFormDto;
import com.kh.sintoburi.domain.hn.EnquiryImageVo;
import com.kh.sintoburi.domain.hn.EnquiryReplyVo;
import com.kh.sintoburi.domain.hn.EnquiryVo;
import com.kh.sintoburi.domain.hn.FaqVo;
import com.kh.sintoburi.domain.hn.HnCriteria;
import com.kh.sintoburi.domain.hn.HnPageDto;
import com.kh.sintoburi.domain.hn.HnUserDto;
import com.kh.sintoburi.domain.hn.NoticeVo;
import com.kh.sintoburi.service.hn.EnquiryReplyService;
import com.kh.sintoburi.service.hn.EnquiryService;
import com.kh.sintoburi.service.hn.FaqService;
import com.kh.sintoburi.service.hn.NoticeService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/hn/mypage/*")
@Log4j
public class MypageController {

	@Autowired
	private EnquiryService enquiryService;

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private EnquiryReplyService replyService;

	@Autowired
	private FaqService faqService;

	@GetMapping("/myPageMain")
	public void myPageMain() {

	}

	// 1:1 문의사항
	@GetMapping("/enqList")
	public String getEnquiryList(HttpSession session, Model model, HnCriteria criteria) {
		// 세션에서 로그인한 사용자 정보 가져오기
		HnUserDto login = (HnUserDto) session.getAttribute("login");

		// 로그인 상태 확인
		if (login == null) {
			// 로그인되지 않은 경우 로그인 페이지로 리다이렉트
			return "redirect:/hn/main/login";
		}

		String user_id = login.getUser_id();
		criteria.setUser_id(user_id);

		List<EnquiryVo> list = enquiryService.getList(criteria);

		model.addAttribute("list", list);

		int total = enquiryService.getTotalCount(criteria);
		HnPageDto pageMaker = new HnPageDto(criteria, total);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("criteria", criteria);
		// 답변
		List<EnquiryReplyVo> replyLisy = replyService.replyList();
		model.addAttribute("replyList", replyLisy);

		return "hn/mypage/enqList";
	}

	@GetMapping("/enqRegisterForm")
	public void enqRegisterForm() {

	}

	// 문의사항 작성
	@PostMapping("/enqRegister")
	public String enqRegister(EnquiryFormDto dto, RedirectAttributes rttr) throws IOException {
		log.info("dto:" + dto);
		List<MultipartFile> imageFiles = dto.getImage();

		String uploadPath = "D:/upload/sintoburi/enquiry";

		File folder = new File(uploadPath);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		List<EnquiryImageVo> imageList = new ArrayList<>();

		for (MultipartFile multi : imageFiles) {
			// UUID를 이용해 파일 이름 생성
			String uuid = UUID.randomUUID().toString();
			String originalFileName = multi.getOriginalFilename(); // 이미지이름
			if (originalFileName == null || originalFileName.trim().isEmpty()) {
				continue; // 이미지 이름이 없으면 처리하지 않음
			}
			String savedFileName = uuid + "_" + multi.getOriginalFilename();
			File savedFile = new File(uploadPath, savedFileName);

			multi.transferTo(savedFile);

			EnquiryImageVo imageVo = EnquiryImageVo.builder().uuid(uuid).upload_path(uploadPath)
					.image_name(originalFileName).build();
			imageList.add(imageVo);
			System.out.println("imageVo: " + imageVo);

		}

		EnquiryVo enquiryVo = EnquiryVo.builder().content(dto.getContent()).enquiry_type(dto.getEnquiry_type())
				.user_id(dto.getUser_id()).imageList(imageList).build();

		int eno = enquiryService.register(enquiryVo);
		rttr.addFlashAttribute("enqRegister", eno);
		return "redirect:/hn/mypage/enqList";
	}

	// 문의사항 데이터 1개
	@GetMapping("/enqRead")
	public String enqRead(@RequestParam("eno") int eno, Model model) {
		EnquiryVo enquiryVo = enquiryService.selectByEno(eno);
		model.addAttribute("enquiryVo", enquiryVo);
		return "hn/mypage/enqRead";
	}

	// 수정
	@PostMapping("/enqMod")
	public String enqMod(EnquiryFormDto dto, RedirectAttributes rttr) throws IOException {
		log.info("dto:" + dto);
		List<MultipartFile> imageFiles = dto.getImage();

		String uploadPath = "D:/upload/sintoburi/enquiry";

		File folder = new File(uploadPath);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		List<EnquiryImageVo> imageList = new ArrayList<>();

		for (MultipartFile multi : imageFiles) {
			// UUID를 이용해 고유한 파일 이름 생성
			String uuid = UUID.randomUUID().toString();
			String originalFileName = multi.getOriginalFilename(); // 이미지이름
			String savedFileName = uuid + "_" + multi.getOriginalFilename();
			File savedFile = new File(uploadPath, savedFileName);

			multi.transferTo(savedFile);

			EnquiryImageVo imageVo = EnquiryImageVo.builder().uuid(uuid).upload_path(uploadPath)
					.image_name(originalFileName).build();
			imageList.add(imageVo);
			System.out.println("imageVo: " + imageVo);

		}

		EnquiryVo enquiryVo = EnquiryVo.builder().content(dto.getContent()).enquiry_type(dto.getEnquiry_type())
				.user_id(dto.getUser_id()).imageList(imageList).build();

		boolean result = enquiryService.modify(enquiryVo);
		rttr.addFlashAttribute("resultMod", result);
		return "redirect:/hn/mypage/enqList";
	}

	// 삭제
	@PostMapping("/enqDel")
	public String enqDel(@RequestParam("eno") int eno, RedirectAttributes rttr) {
		boolean result = enquiryService.remove(eno);
		rttr.addFlashAttribute("resultDel", result);
		return "redirect:/hn/mypage/enqList";
	}

	// 공지사항
	@GetMapping("/noticeList")
	public void noticeList(Model model, HnCriteria criteria) {
		List<NoticeVo> list = noticeService.getListNotice(criteria);
		model.addAttribute("noticeList", list);
		
		int total = noticeService.getTotalCount(criteria);
		HnPageDto pageMaker = new HnPageDto(criteria, total);
		System.out.println("Criteria: " + criteria);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("criteria", criteria);
		
	}

	// 공지사항 상세보기
	@GetMapping("/noticeRead")
	public String notiveRead(@RequestParam("n_no") int n_no, Model model) {
		// 상세
		NoticeVo noticeVo = noticeService.selectByNno(n_no);
		model.addAttribute("noticeVo", noticeVo);
		// 이전게시글
		NoticeVo previousNotice = noticeService.getPreviousNotice(n_no);
		model.addAttribute("previousNotice", previousNotice);
		// 다음게시글
		NoticeVo nextNotice = noticeService.getNextNotice(n_no);
		model.addAttribute("nextNotice", nextNotice);

		return "hn/mypage/noticeRead";
	}

	// 자주하는질문
	@GetMapping("/faqList")
	public void questionList(Model model,HnCriteria criteria) {
		List<FaqVo> list = faqService.faqList(criteria);
		model.addAttribute("faqList", list);
		
		int total = faqService.getTotalCount(criteria);
		HnPageDto pageMaker = new HnPageDto(criteria, total);
		System.out.println("Criteria: " + criteria);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("criteria", criteria);
	}
}
