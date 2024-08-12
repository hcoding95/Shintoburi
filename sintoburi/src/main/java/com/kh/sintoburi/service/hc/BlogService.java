package com.kh.sintoburi.service.hc;

import java.util.List;

import com.kh.sintoburi.domain.hc.AttachFileDto;
import com.kh.sintoburi.domain.hc.BlogVo;
import com.kh.sintoburi.domain.hc.ProductTagDto;

public interface BlogService {
	
	public List<BlogVo> getList();
	public BlogVo readByBlogNo(int blog_no);
	public boolean insert(BlogVo blogVo);
	public boolean modify(BlogVo blogVo);
	public boolean delete(int blog_no);
		

}
