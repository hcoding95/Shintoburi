package com.kh.sintoburi.service.hn;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.hn.NoticeVo;
import com.kh.sintoburi.mapper.hn.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;

	@Override
	public List<NoticeVo> getListNotice() {
		List<NoticeVo> list = noticeMapper.selectNotice();
		return list;
	}

	@Override
	public NoticeVo selectByNno(int n_no) {
		NoticeVo vo = noticeMapper.selectByNno(n_no);
		return vo;
	}

	@Override
	public boolean registerNotice(NoticeVo noticeVo) {
		int count = noticeMapper.insertNotice(noticeVo);
		return (count == 1) ? true : false;
	}

	@Override
	public boolean modifyNotice(NoticeVo noticeVo) {
		int count = noticeMapper.updateNotice(noticeVo);
		return (count == 1) ? true : false;
	}

	@Override
	public boolean removeNotice(int n_no) {
		int count = noticeMapper.deleteNotice(n_no);
		return (count == 1) ? true : false;
	}

}
