package com.msix.admin.review.service;

import java.util.List;

import com.msix.admin.review.vo.ReviewVO;

public interface ReviewService {
	public List<ReviewVO> boardList(ReviewVO rvo);
	public ReviewVO boardDetail(ReviewVO rvo);
	public int boardDelete(ReviewVO rvo);
	public int replyCnt(int rv_no);
	
}
