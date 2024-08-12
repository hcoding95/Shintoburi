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
	
	@Transactional
	@Override
	public boolean modify(BlogVo blogVo) {
		int result = blogMapper.updateBlog(blogVo);
		int blog_no = blogVo.getBlog_no();
		List<AttachFileDto> fileList = blogVo.getFileList();
		List<AttachFileDto> tbl_fileList = attachMapper.getAttachList(blog_no);
		
		System.out.println(fileList);
		if(fileList != null) {
			//기존 데이터와 비교하여 중복체크 
			for ( AttachFileDto dbDto : tbl_fileList) {
				String dbUuid = dbDto.getUuid();
				for (AttachFileDto insertDto : fileList) {
					String insertUuid = insertDto.getUuid();
					if(dbUuid.equals(insertUuid)) {
						dbDto.setDuplicate(true);
						break;
					}
				}
				// 중복 되지 않았다면 삭제
				if(!dbDto.isDuplicate()) {
					attachMapper.deleteByUuid(dbUuid);
				}
			}
			
			fileList.forEach(dto -> {
				int file_blog_no = dto.getBlog_no();
				// 이게 새로 만든 이미지일경우
				if(file_blog_no == 0) {
					dto.setBlog_no(blog_no);
					attachMapper.insert(dto);
				} else {
					attachMapper.update(dto);
				}
			});
		}
		List<ProductTagDto> productTagList = blogVo.getProductTagList();
		List<ProductTagDto> tbl_productTagList = productTagMapper.getTagList(blog_no);
		if(productTagList != null) {
			// 기존 데이터와 중복 체크
			for ( ProductTagDto dbDto : productTagList) {
				int dbProduct_id = dbDto.getProduct_id();
				for (ProductTagDto insertDto : tbl_productTagList) {
					int insertProduct_id = insertDto.getProduct_id();
					if(dbProduct_id == insertProduct_id) {
						dbDto.setDuplicate(true);
						break;
					}
				}
				// 중복 되지 않았다면 삭제
				if(!dbDto.isDuplicate()) {
					productTagMapper.deleteByPrimaryKey(dbDto);
				}
			}
			productTagList.forEach(dto -> {
				int tag_blog_no = dto.getBlog_no();
				//새로 만든 태그인지 체크
				if(tag_blog_no == 0) {
					dto.setBlog_no(blog_no);
					productTagMapper.insert(dto);
				} else {
					productTagMapper.update(dto);
				}
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
	
	@Transactional
	@Override
	public BlogVo readByBlogNo(int blog_no) {
		BlogVo blogVo = blogMapper.getBlogVoByBlogNo(blog_no);
		List<AttachFileDto> fileList =  attachMapper.getAttachList(blog_no);
		if(fileList.size() != 0) {
			blogVo.setFileList(fileList);
		}
		List<ProductTagDto> productTagList = productTagMapper.getTagList(blog_no);
		if (productTagList.size() != 0 ) {
			blogVo.setProductTagList(productTagList);
		}
		return blogVo;
	}

}
