package com.kh.sintoburi.service.ji;

import java.util.List;

import com.kh.sintoburi.domain.ji.ReviewVo;

public interface ReviewService {

//    public List<ReviewVo> getReviewsByProductNo(int pno, String sortOrder);
	

    public boolean insertReview(ReviewVo reviewVo);

    public boolean modifyReview(ReviewVo reviewVo);

    public boolean removeReview(int review_no, int pno);

    public List<ReviewVo> getReviewsByProductNo(ReviewVo ReviewVo);
    
    public Double getAverageRating(int pno);
}
