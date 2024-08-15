package com.kh.sintoburi.controller.hn;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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

import com.kh.sintoburi.domain.hn.HnCriteria;
import com.kh.sintoburi.domain.hn.EnquiryFormDto;
import com.kh.sintoburi.domain.hn.EnquiryVo;
import com.kh.sintoburi.domain.hn.FaqVo;
import com.kh.sintoburi.domain.hn.NoticeVo;
import com.kh.sintoburi.domain.hn.HnPageDto;
import com.kh.sintoburi.domain.hn.EnquiryReplyVo;
import com.kh.sintoburi.domain.hn.HnUserDto;
import com.kh.sintoburi.service.hn.EnquiryService;
import com.kh.sintoburi.service.hn.FaqService;
import com.kh.sintoburi.service.hn.NoticeService;
import com.kh.sintoburi.service.hn.EnquiryReplyService;
import com.kh.sintoburi.util.hn.MyFileUtil;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

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
			return "redirect:/hn/user/login";
		}

		String user_id = login.getUser_id();
		List<EnquiryVo> list = enquiryService.getList(user_id);
		model.addAttribute("list", list);
		
		int total = enquiryService.getTotalCount(criteria);
		HnPageDto pageMaker = new HnPageDto(criteria, total);
		model.addAttribute("pageMaker", pageMaker);
		
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
//		log.info("image:" + image);
		log.info("dto:" + dto);
		MultipartFile multi = dto.getImage();

		String uploadPath = "D:/upload/sintoburi/enquiry";

		File folder = new File(uploadPath);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		String fileName = multi.getOriginalFilename();
//		log.info("fileName:" + fileName);
		String image = dto.getImage().getOriginalFilename();

		// 폴더이름 얻어오기
		String folderName = folder.getName();
//		log.info("folderName: " + folderName);

		EnquiryVo vo = EnquiryVo.builder()
				.content(dto.getContent())
				.enquiry_type(dto.getEnquiry_type())
				.user_id(dto.getUser_id())
				.image(folderName)
				.build();
		log.info("vo:" + vo);

		// 파일을 디스크에 저장

		String uuid = UUID.randomUUID().toString();
		String savedFileName = uuid + "_" + multi.getOriginalFilename();
		File f = new File(uploadPath, savedFileName);
		// 업로드된 파일이 이미지라면 썸네일 이미지 생성
		// 썸네일 파일명: s_원본이미지명

		boolean isImage = MyFileUtil.checkImageType(f);

		if (isImage) {
			// 원본 파일을 읽어서 -> 썸네일 파일로 출력
			FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + savedFileName));

			Thumbnailator.createThumbnail(multi.getInputStream(), thumbnail, 100, 100);
			thumbnail.close();
		}
		multi.transferTo(f);

		boolean result = enquiryService.register(vo);
		log.info("result:" + result);
		rttr.addFlashAttribute("enqRegister", result);
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
//		log.info("image:" + image);
		log.info("dto:" + dto);
		MultipartFile multi = dto.getImage();

		String uploadPath = "D:/upload/sintoburi/enquiry"; // 이미지 저장

		File folder = new File(uploadPath);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		// 이미지 이름 얻어오기
		String fileName = multi.getOriginalFilename();
//		log.info("fileName:" + fileName);
		String image = dto.getImage().getOriginalFilename(); 

		// 폴더이름 얻어오기
		String folderName = folder.getName();
//		log.info("folderName: " + folderName);

		EnquiryVo enquiryVo = EnquiryVo.builder()
				.content(dto.getContent())
				.enquiry_type(dto.getEnquiry_type())
				.user_id(dto.getUser_id())
				.image(folderName)
				.eno(dto.getEno())
				.build();
		log.info("enquiryVo:" + enquiryVo);

		// 파일을 디스크에 저장

		String uuid = UUID.randomUUID().toString();
		String savedFileName = uuid + "_" + multi.getOriginalFilename();
		File f = new File(uploadPath, savedFileName);
		// 업로드된 파일이 이미지라면 썸네일 이미지 생성
		// 썸네일 파일명: s_원본이미지명

		boolean isImage = MyFileUtil.checkImageType(f);

		if (isImage) {
			// 원본 파일을 읽어서 -> 썸네일 파일로 출력
			FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + savedFileName));

			Thumbnailator.createThumbnail(multi.getInputStream(), thumbnail, 100, 100);
			thumbnail.close();
		}
		multi.transferTo(f);
		
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
	public void noticeList(Model model) {
		List<NoticeVo> list = noticeService.getListNotice();
		model.addAttribute("noticeList", list);
	}
	// 공지사항 상세보기 
	@GetMapping("/noticeRead")
	public String notiveRead(@RequestParam("n_no") int n_no , Model model) {
		// 상세
		NoticeVo noticeVo = noticeService.selectByNno(n_no);
		model.addAttribute("noticeVo",noticeVo);
		// 이전게시글
		NoticeVo previousNotice = noticeService.getPreviousNotice(n_no);
		model.addAttribute("previousNotice",previousNotice);
		// 다음게시글
		NoticeVo nextNotice = noticeService.getNextNotice(n_no);
		model.addAttribute("nextNotice",nextNotice);
		
		return "hn/mypage/noticeRead";
	}

	// 자주하는질문 
	@GetMapping("/faqList")
	public void questionList(Model model) {
		List<FaqVo> list = faqService.faqList();
		model.addAttribute("faqList",list);
	}
}
