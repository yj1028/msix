package com.msix.admin.review.dao;

import java.util.List;

import com.msix.admin.review.vo.AReviewVO;

public interface AReviewDAO {
	public int rvboardListCnt(AReviewVO rvo);
	public List<AReviewVO> boardList(AReviewVO rvo);
	public AReviewVO boardDetail(AReviewVO rvo);
	public int boardDelete(AReviewVO rvo);
	
}
