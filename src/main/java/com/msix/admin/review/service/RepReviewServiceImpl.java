package com.msix.admin.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.admin.review.dao.RepReviewDAO;
import com.msix.admin.review.vo.RepReviewVO;

import lombok.Setter;

@Service
public class RepReviewServiceImpl implements RepReviewService {
	
	@Setter(onMethod_ = @Autowired)
	private RepReviewDAO repReviewDAO;
	
	@Override
	public List<RepReviewVO> replyList(Integer rv_no) {
		List<RepReviewVO> list = null;
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
