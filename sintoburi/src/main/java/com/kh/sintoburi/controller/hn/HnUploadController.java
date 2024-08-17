package com.kh.sintoburi.controller.hn;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
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
public class HnUploadController {

	// <img src="/display?fileName="/>
	@ResponseBody
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileName) throws Exception {
		File f = new File(fileName);
		// binary data
		byte[] data = FileCopyUtils.copyToByteArray(f);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", Files.probeContentType(f.toPath())); // image/png
		ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(data, headers, HttpStatus.OK);
		return entity;
	}

}
