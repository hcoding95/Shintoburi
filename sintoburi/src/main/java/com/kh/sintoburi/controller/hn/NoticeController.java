package com.kh.sintoburi.controller.hn;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.kh.sintoburi.domain.hn.EnquiryVo;
import com.kh.sintoburi.domain.hn.EnquiryImageVo;
import com.kh.sintoburi.domain.hn.NoticeFormDto;
import com.kh.sintoburi.domain.hn.NoticeImageVo;
import com.kh.sintoburi.domain.hn.NoticeVo;
import com.kh.sintoburi.service.hn.NoticeService;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/hn/manager/notice")
@Log4j
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

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

		log.info("dto:" + dto);
		List<MultipartFile> imageFiles = dto.getImage();

		String uploadPath = "D:/upload/sintoburi/enquiry";

		File folder = new File(uploadPath);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		List<NoticeImageVo> imageList = new ArrayList<>();
		
		for (MultipartFile multi : imageFiles) {
			// UUID를 이용해 고유한 파일 이름 생성
			String uuid = UUID.randomUUID().toString();
			String originalFileName = multi.getOriginalFilename(); // 이미지이름
			String savedFileName = uuid + "_" + multi.getOriginalFilename(); 
			File savedFile = new File(uploadPath, savedFileName);

			multi.transferTo(savedFile);

			NoticeImageVo imageVo = NoticeImageVo.builder()
					.uuid(uuid)
					.upload_path(uploadPath)
					.image_name(originalFileName)
					.build();
			imageList.add(imageVo);
			System.out.println("imageVo: " + imageVo);

		}
		
		NoticeVo noticeVo = NoticeVo.builder()
				.content(dto.getContent())
				.title(dto.getTitle())
				.imageList(imageList)
				.build();

		int n_no = noticeService.registerNotice(noticeVo);
		rttr.addFlashAttribute("registerNotice", n_no);
		return "redirect:/hn/manager/notice/noticeList";

	}

	// 공지사항 상세보기
	@GetMapping("/noticeDetail/{n_no}")
	public String noticeDetail(@PathVariable("n_no") int n_no, Model model) {
		NoticeVo noticeVo = noticeService.selectByNno(n_no);
		model.addAttribute("noticeVo", noticeVo);

		return "hn/manager/notice/noticeDetail";
	}

	// 공지사항 수정
	@PostMapping("/noticeMod")
	public String noticeMod(NoticeFormDto dto, RedirectAttributes rttr) throws IOException {

//		boolean result = noticeService.modifyNotice(vo);
//		rttr.addFlashAttribute("noticeMod", result);
		return "redirect:/hn/manager/notice/noticeList";
	}

	// 공지사항 삭제
	@PostMapping("/noticeDel")
	public String noticeDel(@RequestParam("n_no") int n_no, RedirectAttributes rttr) {
		boolean result = noticeService.removeNotice(n_no);
		rttr.addFlashAttribute("noticeDel", result);
		return "redirect:/hn/manager/notice/noticeList";
	}

	// 공지사항 항목 수정
	@PostMapping("/updateImportant")
	@ResponseBody
	public boolean updateImportant(@RequestBody NoticeVo vo) {
		String important = vo.getImportant();
		int n_no = vo.getN_no();
		boolean result = noticeService.updateImportant(n_no, important);
		return result;
	}

}
