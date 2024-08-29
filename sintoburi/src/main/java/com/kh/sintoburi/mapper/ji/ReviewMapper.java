package com.kh.sintoburi.mapper.ji;

import java.util.List;
import java.util.Map;

import com.kh.sintoburi.domain.ji.ReviewVo;

public interface ReviewMapper {

	 
//	 public List<ReviewVo> selectReviewsByProductNo(@Param("pno") int pno, @Param("sortOrder") String sortOrder);
//	 public List<ReviewVo> selectReviewsByProductNo(Map<String, Object> map);
	 
	 public int insertReview(ReviewVo reviewVo);

	 public int modifyReview(ReviewVo reviewVo);
	
	 public int deleteReview(Map<String, Object> params);

	 public List<ReviewVo> selectReviewsByProductNo(ReviewVo ReviewVo);
	 
	 public Double selectAverageRating(int pno);
}
	