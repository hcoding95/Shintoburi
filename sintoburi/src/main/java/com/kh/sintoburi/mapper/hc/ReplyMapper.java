package com.kh.sintoburi.mapper.hc;

import java.util.List;

import com.kh.sintoburi.domain.hc.AttachFileDto;
import com.kh.sintoburi.domain.hc.BlogVo;
import com.kh.sintoburi.domain.hc.LoginDto;
import com.kh.sintoburi.domain.hc.ReplyDto;
import com.kh.sintoburi.domain.hc.UserVo;


public interface ReplyMapper {

	public List<ReplyDto> getListByBlog_no(int blog_no);
	public int insertReply(ReplyDto replyDto);
	
	
	public int updateBlog(BlogVo blogVo);
	public int deteteByBlog_no(int blog_no);
	public List<BlogVo> getListWithPage();
	public BlogVo getBlogVoByBlogNo(int blog_no);
	
	
}
