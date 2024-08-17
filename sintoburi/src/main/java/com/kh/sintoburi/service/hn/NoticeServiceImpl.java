package com.kh.sintoburi.service.hn;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.hn.EnquiryImageVo;
import com.kh.sintoburi.domain.hn.NoticeImageVo;
import com.kh.sintoburi.domain.hn.NoticeVo;
import com.kh.sintoburi.mapper.hn.NoticeMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
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
		List<NoticeImageVo> list = noticeMapper.getImage(n_no);
		vo.setImageList(list);
		return vo;
	}

	@Override
	public int registerNotice(NoticeVo vo) {
		int count = noticeMapper.insertNotice(vo);

		List<NoticeImageVo> list = vo.getImageList();
		if (list != null && list.size() > 0) {
			list.forEach(imageVo -> {
				imageVo.setN_no(vo.getN_no());
				log.info("Inserting image: " + imageVo);
				noticeMapper.imageInsert(imageVo);
			});
		}

		if (count > 0) {
			return vo.getN_no();
		}
		return 0;
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

	@Override
	public NoticeVo getPreviousNotice(int n_no) {
		NoticeVo noticeVo = noticeMapper.getPreviousNotice(n_no);
		return noticeVo;
	}

	@Override
	public NoticeVo getNextNotice(int n_no) {
		NoticeVo noticeVo = noticeMapper.getNextNotice(n_no);
		return noticeVo;
	}

	@Override
	public boolean updateImportant(int n_no, String important) {
		int count = noticeMapper.updateImportant(n_no, important);
		return (count == 1) ? true : false;
	}

}
