package com.msix.admin.review.service;

import java.util.List;

import com.msix.admin.review.vo.RepReviewVO;

public interface RepReviewService {
	public List<RepReviewVO> replyList(Integer rv_no);
	public int replyEachDelete(int c_no);	//선택된 댓글 삭제
	
}
