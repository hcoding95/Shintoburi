package com.kh.sintoburi.mapper.hc;

import java.util.List;

import com.kh.sintoburi.domain.hc.AttachFileDto;
import com.kh.sintoburi.domain.hc.BlogVo;
import com.kh.sintoburi.domain.hc.LoginDto;
import com.kh.sintoburi.domain.hc.UserVo;


public interface BlogMapper {

	public int insertSelectKey(BlogVo blogVo);
	public int updateBlog(BlogVo blogVo);
	public List<BlogVo> getListWithPage();
	public BlogVo getBlogVoByBlogNo(int blog_no);
	
	
}
