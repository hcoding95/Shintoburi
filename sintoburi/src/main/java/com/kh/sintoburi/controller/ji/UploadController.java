package com.kh.sintoburi.controller.ji;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.sintoburi.domain.ji.ImageVo;
import com.kh.sintoburi.util.ji.MyFileUtil;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {

	@GetMapping("/uploadForm")
	public void uploadForm() {
		
	}
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Date today = new Date();
		String folders = sdf.format(today);
		return folders;
	}
	
	
	
	@ResponseBody
	@PostMapping("/uploadFormAction")
	public List<ImageVo> uploadFormAction(MultipartFile[] uploadFile) throws Exception {
		log.info("uploadFormAction...");
		String uploadPath = "G:/upload/" + getFolder();
		File folder = new File(uploadPath);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		
		List<ImageVo> list = new ArrayList<>();
		
		for (MultipartFile multi : uploadFile) {
			
			String uuid = UUID.randomUUID().toString();
			String savedFileName = uuid + "_" + multi.getOriginalFilename();
			File f = new File(uploadPath, savedFileName);
			// 업로드된 파일이 이미지라면 썸네일 이미지 생성
			// 썸네일 파일명: s_원본이미지명
			boolean isImage = MyFileUtil.checkImageType(f);
			
			
			ImageVo attachDto = ImageVo.builder()
					.img_name(multi.getOriginalFilename())
					.uuid(uuid)
					.img_path(uploadPath)
					.build();
			list.add(attachDto);
			
			if (isImage) {
				// 원본 파일을 읽어서 -> 썸네일 파일로 출력
				FileOutputStream thumbnail = new FileOutputStream(
						new File(uploadPath, "s_" + savedFileName));
				
				Thumbnailator.createThumbnail(
						multi.getInputStream(), thumbnail, 100, 100);
				thumbnail.close();
			}
			multi.transferTo(f);
		}
		return list;
	}
	
//	@GetMapping("/uploadAjax")
//	public void uploadAjax() {
//		
//	}
	
	// <img src="/display?fileName="/>
	@ResponseBody
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileName) throws Exception {
		File f = new File("G:/" + fileName);
		// binary data
		byte[] data = FileCopyUtils.copyToByteArray(f);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", Files.probeContentType(f.toPath())); // image/png
		ResponseEntity<byte[]> entity =
				new ResponseEntity<byte[]>(data, headers, HttpStatus.OK);
		return entity;
	}
	
	@GetMapping(value = "/download",
				produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	// org.springframework.core.io.Resource
	public ResponseEntity<Resource> downloadFile(String fileName) throws Exception {
		// 2024/07/25/69a437d2-f608-4259-be4d-9b474deff251_test.txt
		Resource resource = new FileSystemResource(fileName);
		String resourceName = resource.getFilename();
		int userScoreIndex = resourceName.indexOf("_");
		String attachName = resourceName.substring(userScoreIndex + 1);
		HttpHeaders headers = new HttpHeaders();
		String isoString = new String(attachName.getBytes("utf-8"), "iso-8859-1");
		headers.add("Content-Disposition", "attachment; filename=" 
				+ isoString);
		ResponseEntity<Resource> entity = new ResponseEntity<Resource>(
				resource, headers, HttpStatus.OK);
		return entity;
	}
	
	// server.xml 
	// - <Connect port="80" parseBodyMethods="POST,PUT,PATCH,DELETE">
	@DeleteMapping("/delete")
	@ResponseBody
	public String delete(String fileName) {
		String result = MyFileUtil.delete(fileName);
		// 삭제 처리
		return result;
	}
}
