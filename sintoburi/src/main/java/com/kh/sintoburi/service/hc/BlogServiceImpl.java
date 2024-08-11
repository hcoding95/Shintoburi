package com.kh.sintoburi.service.hc;

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

@Service
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
		List<AttachFileDto> fileList = blogVo.getFileList();
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

}
