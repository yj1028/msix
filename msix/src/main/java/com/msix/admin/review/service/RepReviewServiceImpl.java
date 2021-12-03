package com.msix.admin.review.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.msix.admin.review.vo.RepReviewVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class RepReviewServiceImpl implements RepReviewService {
	
	private RepReviewService repReviewService;
	
	@Override
	public List<RepReviewVO> replyList(int rv_no) {
		List<RepReviewVO> list = null;
		list = repReviewService.replyList(rv_no);
		return list;
	}

	// 댓글 삭제
	@Override
	public int replyEachDelete(int c_no) {
		int result = 0;
		result = repReviewService.replyEachDelete(c_no);
		return result;
	}

}
