package com.kh.sintoburi.service.hn;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.hn.HnCriteria;
import com.kh.sintoburi.domain.hn.EnquiryVo;
import com.kh.sintoburi.mapper.hn.EnquiryMapper;

@Service
public class EnquriyServiceImpl implements EnquiryService {

	@Autowired
	private EnquiryMapper enquiryMapper;

	// 로그인한 사용자의 문의사항
	@Override
	public List<EnquiryVo> getList(String user_id) {
		List<EnquiryVo> list = enquiryMapper.getList(user_id);
		return list;
	}

	// 게시글 갯수
	@Override
	public int getTotalCount(HnCriteria criteria) {
		int count = enquiryMapper.getTotalCount(criteria);
		return count;
	}

	// 상품문의사항목록
	@Override
	public List<EnquiryVo> goodsGetList(HnCriteria criteria) {
//		List<EnquiryVo> list = enquiryMapper.goodsGetList();
		List<EnquiryVo> list = enquiryMapper.getGoodsWithPaging(criteria);
		return list;
	}

	// 등급문의사항
	@Override
	public List<EnquiryVo> gradeGetList(HnCriteria criteria) {
//		List<EnquiryVo> list = enquiryMapper.gradeGetList();
		List<EnquiryVo> list = enquiryMapper.getGradeWithPaging(criteria);
		return list;
	}

	// 문의사항등록
	@Override
	public boolean register(EnquiryVo vo) {
		int count = enquiryMapper.insert(vo);
		return (count == 1) ? true : false;
	}

	// 문의사항수정
	@Override
	public boolean modify(EnquiryVo vo) {
		int count = enquiryMapper.update(vo);
		return (count == 1) ? true : false;
	}

	// 문의사항삭제
	@Override
	public boolean remove(int eno) {
		int count = enquiryMapper.delete(eno);
		return (count == 1) ? true : false;
	}

	// 문의사항데이터1개
	@Override
	public EnquiryVo selectByEno(int eno) {
		EnquiryVo vo = enquiryMapper.selectByEno(eno);
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
	public boolean gradeUpdateStatus(int eno,String status) {
		int count = enquiryMapper.gradeUpdateStatus(eno,status);
		return (count == 1) ? true : false;
	}


}
