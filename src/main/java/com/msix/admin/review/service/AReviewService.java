package com.msix.admin.review.service;

import java.util.List;

import com.msix.admin.review.vo.AReviewVO;

public interface AReviewService {
	public int rvboardListCnt(AReviewVO rvo);
	public List<AReviewVO> boardList(AReviewVO rvo);
	public AReviewVO boardDetail(AReviewVO rvo);
	public int boardDelete(AReviewVO rvo);
	public int replyCnt(int rv_no);
	
}
