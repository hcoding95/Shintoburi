package com.kh.sintoburi.controller.hc;

import java.io.File;
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

import com.kh.sintoburi.domain.hc.AttachFileDto;
import com.kh.sintoburi.util.hc.MyfileUtil;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UploadController {
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Date today = new Date();
		String folders = sdf.format(today);
		return folders;
	}
	
	@ResponseBody
	@PostMapping("/uploadFormAction")
	public List<AttachFileDto> uploadFormAction(MultipartFile[] uploadFiles) throws Exception {
		String uploadPath = "D:/upload/"+ getFolder();
		// E:/upload/2024/07/23 ...
		File folder = new File(uploadPath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		List<AttachFileDto> list = new ArrayList<AttachFileDto>();
		
		for (MultipartFile file : uploadFiles) {
			//AttachFileDto attachDto = new AttachFileDto();
			String uuid = UUID.randomUUID().toString();
			String savedName = uuid + "_" + file.getOriginalFilename();
			File f = new File(uploadPath, savedName);
			boolean isImage = MyfileUtil.checkImageType(f);
			AttachFileDto attachDto = new AttachFileDto();
			attachDto.setFile_name(file.getOriginalFilename());
			attachDto.setUuid(uuid);
			attachDto.setFile_path(uploadPath);
			attachDto.setImage(isImage);
			list.add(attachDto);
			file.transferTo(f);
		}
		return list;
	}
	
	
	@ResponseBody
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFiles(String file_name) throws Exception {
		File f = new File(file_name);
		// binary data == byte[]
		byte[] data = FileCopyUtils.copyToByteArray(f);
		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
		headers.add("Content-Type", Files.probeContentType(f.toPath()));
		ResponseEntity<byte[]> entity = 
				new ResponseEntity<byte[]>(data, headers, HttpStatus.OK );
		return entity;
	}
	
	@GetMapping(value = "/download",
				produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	//org.springframework.core.io.
	public ResponseEntity<Resource> downloadFile(String fileName) throws Exception{
		//log.info("download File :" + fileName);
		Resource resource = new FileSystemResource(fileName);
		//log.info("resuorce : " + resource);
		String resourceName = resource.getFilename();
		//log.info("resouceName : "  + resourceName);
		int userScoreIndex = resourceName.indexOf("_");
		String attachName = resourceName.substring(userScoreIndex + 1);// uuid 가 빠진 실제 파일명
		//log.info("attachName : " + attachName);
		HttpHeaders headers = new HttpHeaders();
		// 한글처리는 이코딩을 해줘야 됨
		headers.add("Content-Disposition", "attachment; filename=" 
		+ new String(attachName.getBytes("utf-8"), "iso-8859-1"));
		ResponseEntity<Resource> entity = new ResponseEntity<Resource> (
					resource, headers, HttpStatus.OK);
		return entity;
	}
	
	///{map:.+}
	@DeleteMapping("/delete")
	@ResponseBody
	public String delete(String fileName) {
		System.out.println("내가받은 파일 네임은" + fileName);
		String result = MyfileUtil.delete(fileName);
		return result;
	}
	
		
	
	
	
}
