package com.kh.sintoburi.service.hn;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sintoburi.domain.hn.EnquiryImageVo;
import com.kh.sintoburi.domain.hn.EnquiryVo;
import com.kh.sintoburi.domain.hn.HnCriteria;
import com.kh.sintoburi.mapper.hn.EnquiryMapper;
import com.kh.sintoburi.util.hn.MyFileUtil;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class EnquriyServiceImpl implements EnquiryService {

	@Autowired
	private EnquiryMapper enquiryMapper;

	// 로그인한 사용자의 문의사항
	@Override
	public List<EnquiryVo> getList(HnCriteria criteria) {
//		List<EnquiryVo> list = enquiryMapper.getList(user_id);
		List<EnquiryVo> list = enquiryMapper.getWithPaging(criteria);
		return list;
	}

	// 전체 게시글 갯수
	@Override
	public int getTotalCount(HnCriteria criteria) {
		int count = enquiryMapper.getTotalCount(criteria);
		return count;
	}

	// 상품문의사항목록(페이징)
	@Override
	public List<EnquiryVo> goodsGetList(HnCriteria criteria) {
//		List<EnquiryVo> list = enquiryMapper.goodsGetList();
		List<EnquiryVo> list = enquiryMapper.getGoodsWithPaging(criteria);
		return list;
	}

	// 등급문의사항(페이징)
	@Override
	public List<EnquiryVo> gradeGetList(HnCriteria criteria) {
//		List<EnquiryVo> list = enquiryMapper.gradeGetList();
		List<EnquiryVo> list = enquiryMapper.getGradeWithPaging(criteria);
		return list;
	}

	// 등급 게시글 갯수
	@Override
	public int goodsTotalCount(HnCriteria criteria) {
		int count = enquiryMapper.goodsTotalCount(criteria);
		return count;
	}

	// 상품 게시글 갯수
	@Override
	public int gradeTotalCount(HnCriteria criteria) {
		int count = enquiryMapper.gradeTotalCount(criteria);
		return count;
	}

	// 문의사항등록
	@Transactional
	@Override
	public int register(EnquiryVo vo) {
		log.info("before vo:" + vo);
		int count = enquiryMapper.insert(vo);
		// <- eno 없음(0)

		// -> eno 있음(nextval)
		log.info("after vo:" + vo);

		List<EnquiryImageVo> list = vo.getImageList();
		if (list != null && list.size() > 0) {
			list.forEach(imageVo -> {
				imageVo.setEno(vo.getEno());
				log.info("Inserting image: " + imageVo);
				enquiryMapper.imageInsert(imageVo);
			});
		}

		if (count > 0) {
			return vo.getEno();
		}
		return 0;
	}

	// 문의사항수정
	public boolean modify(EnquiryVo vo) {
		int count = enquiryMapper.update(vo);
		return (count == 1) ? true : false;
	}

	// 문의사항삭제
	@Override
	public boolean remove(int eno) {
		
		List<EnquiryImageVo> list = enquiryMapper.getImage(eno);
		list.forEach(vo -> {
			String fileName = vo.getUpload_path() + "/" + vo.getUuid() + "_" + vo.getImage_name();
			MyFileUtil.delete(fileName);
		});
		enquiryMapper.imageDelete(eno);
		
		
		int count = enquiryMapper.delete(eno);
		return (count == 1) ? true : false;
	}

	// 문의사항데이터1개
	@Override
	public EnquiryVo selectByEno(int eno) {
		EnquiryVo vo = enquiryMapper.selectByEno(eno);
		List<EnquiryImageVo> list = enquiryMapper.getImage(eno);
		
		vo.setImageList(list);
		log.info("Retrieved EnquiryVo: " + vo);
		log.info("Image List: " + list);
		return vo;
	}

	// 상품 문의사항 답변완료로 상태변경
	@Override
	public boolean updateStatus(int eno) {
		int count = enquiryMapper.updateStatus(eno);
		return (count == 1) ? true : false;
	}

	// 등급 문의사항 처리완료로 상태변경
	@Override
	public boolean gradeUpdateStatus(int eno, String status) {
		int count = enquiryMapper.gradeUpdateStatus(eno, status);
		return (count == 1) ? true : false;
	}

	@Override
	public List<EnquiryVo> statusAlarm() {
		List<EnquiryVo> list = enquiryMapper.statusAlarm();
		return list;
	}

}
