package com.kh.sintoburi.controller.hn;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.sintoburi.domain.hn.EnquiryReplyVo;
import com.kh.sintoburi.domain.hn.EnquiryVo;
import com.kh.sintoburi.domain.hn.FaqVo;
import com.kh.sintoburi.domain.hn.HnCriteria;
import com.kh.sintoburi.domain.hn.HnPageDto;
import com.kh.sintoburi.domain.hn.HnUserDto;
import com.kh.sintoburi.domain.hn.NoticeFormDto;
import com.kh.sintoburi.domain.hn.NoticeVo;
import com.kh.sintoburi.domain.hn.ReportPostVo;
import com.kh.sintoburi.service.hn.EnquiryReplyService;
import com.kh.sintoburi.service.hn.EnquiryService;
import com.kh.sintoburi.service.hn.FaqService;
import com.kh.sintoburi.service.hn.HnUserService;
import com.kh.sintoburi.service.hn.NoticeService;
import com.kh.sintoburi.service.hn.ReportPostService;
import com.kh.sintoburi.util.hn.MyFileUtil;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/hn/manager/*")
@Log4j
public class ManagerController {

	@Autowired
	private HnUserService userService;

	@Autowired
	private EnquiryService enquiryService;

	@Autowired
	private EnquiryReplyService replyService;

	@Autowired
	private ReportPostService reportPostService;

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private FaqService faqService;

	// 회원리스트

	// 회원목록
	@GetMapping("/userList")
	public void userList(Model model, HnCriteria criteria) {
	    System.out.println("Page Number: " + criteria.getPageNum());
	    System.out.println("Amount per Page: " + criteria.getAmount());

		// 회원목록
		List<HnUserDto> list = userService.getList(criteria);
		int total = userService.getTotal(criteria);
		HnPageDto pageMaker = new HnPageDto(criteria, total);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("userList", list);
		model.addAttribute("criteria", criteria);
	}

	// 매니저목록
	@GetMapping("/managerList")
	public void managerList(Model model, HnCriteria criteria) {

		List<HnUserDto> managerList = userService.managerList(criteria);
		System.out.println("managerList" + managerList);
		int total = userService.managerTotalCount(criteria);

		HnPageDto pageMaker = new HnPageDto(criteria, total);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("managerList", managerList);
		model.addAttribute("criteria", criteria);
	}

	// 등급수정
	@PostMapping("/modGrade")
	@ResponseBody
	public boolean modGrade(@RequestBody HnUserDto dto) {
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
	public void goodsEnqList(Model model, HnCriteria criteria) {
		List<EnquiryVo> list = enquiryService.goodsGetList(criteria);

		int total = enquiryService.getTotalCount(criteria);
		HnPageDto pageMaker = new HnPageDto(criteria, total);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("goodsEnqList", list);

		// 답변 리스트
		List<EnquiryReplyVo> replyLisy = replyService.replyList();
		model.addAttribute("replyList", replyLisy);
	}

	// 상품문의사항, 답변 상세보기
	@GetMapping("/enquiryDetail/{eno}")
	public String enquiryDetail(@PathVariable("eno") int eno, Model model) { 
		System.out.println("enquiryDetail...");
		EnquiryVo enquiryVo = enquiryService.selectByEno(eno);
		model.addAttribute("enquiryVo", enquiryVo);

		EnquiryReplyVo replyVo = replyService.selectByReplyEno(eno);
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
	public void gradeEnqList(Model model, HnCriteria criteria) {
		List<EnquiryVo> list = enquiryService.gradeGetList(criteria);

		int total = enquiryService.getTotalCount(criteria);
		HnPageDto pageMaker = new HnPageDto(criteria, total);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("gradeEnqList", list);

		// 답변리스트
		List<EnquiryReplyVo> replyLisy = replyService.replyList();
		model.addAttribute("gradeReplyList", replyLisy);
	}

	// 등급문의사항, 답변 상세보기
	@GetMapping("/gradeEnqDetail/{eno}")
	public String gradeEnqDetail(@PathVariable("eno") int eno, Model model) {
		System.out.println("enquiryDetail...");
		EnquiryVo enquiryVo = enquiryService.selectByEno(eno);
		model.addAttribute("enquiryVo", enquiryVo);

		EnquiryReplyVo replyVo = replyService.selectByReplyEno(eno);
		model.addAttribute("replyVo", replyVo);
		return "hn/manager/gradeEnqDetail";
	}

	// 등급문의사항 답변완료 변경
	@PostMapping("/gradeupdateStatus")
	public ResponseEntity<String> gradeUpdateStatus(@RequestParam int eno, @RequestParam String status) {
		boolean result = enquiryService.gradeUpdateStatus(eno, status);

		if (result) {
			return ResponseEntity.ok("문의사항 상태가 '" + status + "'로 업데이트되었습니다.");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("문의사항 상태 업데이트에 실패했습니다.");
		}
	}

	// 신고게시글목록
	@GetMapping("/reportList")
	public void reportList(Model model, HnCriteria criteria) {
		List<ReportPostVo> list = reportPostService.ReportList(criteria);
		int total = reportPostService.getTotalCount(criteria);
		HnPageDto pageMaker = new HnPageDto(criteria, total);
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
	public String noticeRegister(NoticeFormDto dto, RedirectAttributes rttr) throws IOException {
//		log.info("image:" + image);
		log.info("vo:" + dto);
		MultipartFile multi = dto.getImage();

		String uploadPath = "D:/upload/sintoburi/notice";

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

		NoticeVo vo = NoticeVo.builder().n_no(dto.getN_no()).title(dto.getTitle()).content(dto.getContent())
				.write_date(dto.getWrite_date()).image(folderName + "/" + fileName).build();
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

		boolean result = noticeService.registerNotice(vo);
		log.info("result:" + result);
		rttr.addFlashAttribute("registerNotice", result);
		return "redirect:/hn/manager/noticeList";

	}

	// 공지사항 상세보기
	@GetMapping("/noticeDetail/{n_no}")
	public String noticeDetail(@PathVariable("n_no") int n_no, Model model) {
		NoticeVo noticeVo = noticeService.selectByNno(n_no);
		model.addAttribute("noticeVo", noticeVo);

		return "hn/manager/noticeDetail";
	}

	// 공지사항 수정
	@PostMapping("/noticeMod")
	public String noticeMod(NoticeFormDto dto, RedirectAttributes rttr) throws IOException {
//		log.info("image:" + image);
		log.info("vo:" + dto);
		MultipartFile multi = dto.getImage();

		String uploadPath = "D:/upload/sintoburi/notice";

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

		NoticeVo vo = NoticeVo.builder().title(dto.getTitle()).content(dto.getContent()).write_date(dto.getWrite_date())
				.image(folderName).n_no(dto.getN_no()).build();
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

		boolean result = noticeService.modifyNotice(vo);
		rttr.addFlashAttribute("noticeMod", result);
		return "redirect:/hn/manager/noticeList";
	}

	// 공지사항 삭제
	@PostMapping("/noticeDel")
	public String noticeDel(@RequestParam("n_no") int n_no, RedirectAttributes rttr) {
		boolean result = noticeService.removeNotice(n_no);
		rttr.addFlashAttribute("noticeDel", result);
		return "redirect:/hn/manager/noticeList";
	}
	
	//공지사항 항목 수정
	@PostMapping("/updateImportant")
	@ResponseBody
	public boolean updateImportant(@RequestBody NoticeVo vo) {
		String important = vo.getImportant();
		int n_no = vo.getN_no();
		boolean result = noticeService.updateImportant(n_no, important);
		return result;
	}

	// 자주하는 질문
	@GetMapping("/faqList")
	public void faqList(Model model) {
		List<FaqVo> list = faqService.faqList();
		model.addAttribute("faqList", list);

	}

	@GetMapping("/faqRegisterForm")
	public void faqRegisterForm() {

	}

	// 자주하는 질문 작성
	@PostMapping("/faqRegister")
	public String faqRegister(FaqVo faqVo, RedirectAttributes rttr) {
		boolean result = faqService.faqRegister(faqVo);
		rttr.addAttribute("faqresult", result);
		return "redirect:/hn/manager/faqList";
	}

	// 자주하는 질문 상세보기
	@GetMapping("/faqDetail/{f_no}")
	public String faqDetail(@PathVariable("f_no") int f_no, Model model) {
		FaqVo faqVo = faqService.selectByFno(f_no);
		model.addAttribute("faqVo", faqVo);

		return "hn/manager/faqDetail";
	}

	// 자주하는 질문 수정
	@PostMapping("/faqMod")
	public String faqMod(FaqVo faqVo, RedirectAttributes rttr) {

		boolean result = faqService.faqModify(faqVo);
		rttr.addFlashAttribute("faqMod", result);
		return "redirect:/hn/manager/faqList";
	}

	// 자주하는 질문 삭제
	@PostMapping("/faqDel")
	public String faqDel(@RequestParam("f_no") int f_no , RedirectAttributes rttr) {
		boolean result = faqService.faqRemove(f_no);
		rttr.addFlashAttribute("faqDel",result);
		return "redirect:/hn/manager/faqList";
	}

}
