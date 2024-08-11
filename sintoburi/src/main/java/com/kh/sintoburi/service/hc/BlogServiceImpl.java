package com.kh.sintoburi.service.hc;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sintoburi.domain.hc.AttachFileDto;
import com.kh.sintoburi.domain.hc.BlogVo;
import com.kh.sintoburi.domain.hc.ProductDto;
import com.kh.sintoburi.domain.hc.ProductTagDto;
import com.kh.sintoburi.mapper.hc.AttachMapper;
import com.kh.sintoburi.mapper.hc.BlogMapper;
import com.kh.sintoburi.mapper.hc.ProductMapper;
import com.kh.sintoburi.mapper.hc.ProductTagMapper;

import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j
public class BlogServiceImpl implements BlogService {
	
	@Autowired
	private BlogMapper blogMapper;
	@Autowired
	private ProductTagMapper productTagMapper;
	@Autowired
	private AttachMapper attachMapper;
	
	@Transactional
	@Override
	public boolean insert(BlogVo blogVo) {
		int result = blogMapper.insertSelectKey(blogVo);
		int blog_no = blogVo.getBlog_no();
		System.out.println("blog_no는??" + blog_no);
		List<AttachFileDto> fileList = blogVo.getFileList();
		System.out.println(fileList);
		if(fileList != null) {
			fileList.forEach(dto -> {
				dto.setBlog_no(blog_no);
				attachMapper.insert(dto);
			});
		}
		List<ProductTagDto> productTagList = blogVo.getProductTagList();
		if(productTagList != null) {
			productTagList.forEach(dto -> {
				dto.setBlog_no(blog_no);
				productTagMapper.insert(dto);
			});
		}
		return (result > 0)? true : false;
	}

	@Override
	public List<BlogVo> getList() {
		List<BlogVo> list = blogMapper.getListWithPage();
		list.forEach(vo -> {
			int blog_no = vo.getBlog_no();
			List<AttachFileDto> attachList = attachMapper.getAttachList(blog_no);
			if(attachList != null) {
				vo.setFileList(attachList);
			}
			List<ProductTagDto> tagList = productTagMapper.getTagList(blog_no);
			if(tagList != null) {
				vo.setProductTagList(tagList);
			}
		});
		
		
		return list;
	}

}
