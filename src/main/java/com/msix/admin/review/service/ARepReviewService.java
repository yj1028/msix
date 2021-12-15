package com.msix.admin.review.service;

import java.util.List;

import com.msix.admin.review.vo.ARepReviewVO;

public interface ARepReviewService {
	public List<ARepReviewVO> replyList(Integer rv_no);
	public int replyEachDelete(int c_no);	//선택된 댓글 삭제
	
}
