package com.msix.admin.review.dao;

import java.util.List;

import com.msix.admin.review.vo.ReviewVO;

public interface ReviewDAO {
	public int rvboardListCnt(ReviewVO rvo);
	public List<ReviewVO> boardList(ReviewVO rvo);
	public ReviewVO boardDetail(ReviewVO rvo);
	public int boardDelete(ReviewVO rvo);
	
}
