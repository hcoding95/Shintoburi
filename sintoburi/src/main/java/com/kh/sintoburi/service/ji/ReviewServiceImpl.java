package com.kh.sintoburi.service.ji;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.ji.ReviewVo;
import com.kh.sintoburi.mapper.ji.ReviewMapper;

@Service
public class ReviewServiceImpl implements ReviewService{

    @Autowired
    private ReviewMapper reviewMapper;

    @Override
    public boolean insertReview(ReviewVo reviewVo) {
    	int count = reviewMapper.insertReview(reviewVo);
        return (count > 0) ? true : false;
    }

    @Override
    public boolean modifyReview(ReviewVo reviewVo) {
        int count = reviewMapper.modifyReview(reviewVo);
        return (count > 0) ? true : false;
    }

    @Override
    public boolean removeReview(int review_no, int pno) {
        Map<String, Object> params = new HashMap<>();
        params.put("review_no", review_no);
        params.put("pno", pno);
        int count = reviewMapper.deleteReview(params);
        return (count > 0) ? true : false;
    }

    @Override
    public List<ReviewVo> getReviewsByProductNo(ReviewVo ReviewVo) {
        return reviewMapper.selectReviewsByProductNo(ReviewVo);
    }

	@Override
	public Double getAverageRating(int pno) {
		return reviewMapper.selectAverageRating(pno);
	}
    
//    @Override
//    public List<ReviewVo> getReviewsByProductNo(int pno, String sortOrder) {
//        Map<String, Object> map = new HashMap<>();
//        map.put("pno", pno);
//        map.put("sortOrder", sortOrder);
//        return reviewMapper.selectReviewsByProductNo(map);
//    } 
}
