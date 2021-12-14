package com.msix.admin.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.admin.review.dao.ARepReviewDAO;
import com.msix.admin.review.vo.ARepReviewVO;

import lombok.Setter;

@Service
public class ARepReviewServiceImpl implements ARepReviewService {
	
	@Setter(onMethod_ = @Autowired)
	private ARepReviewDAO repReviewDAO;
	
	@Override
	public List<ARepReviewVO> replyList(Integer rv_no) {
		List<ARepReviewVO> list = null;
		list = repReviewDAO.replyList(rv_no);
		return list;
	}

	// 댓글 삭제
	@Override
	public int replyEachDelete(int c_no) {
		int result = 0;
		result = repReviewDAO.replyEachDelete(c_no);
		return result;
	}

}