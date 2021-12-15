package com.msix.admin.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.admin.review.dao.ARepReviewDAO;
import com.msix.admin.review.dao.AReviewDAO;
import com.msix.admin.review.vo.AReviewVO;

import lombok.Setter;

@Service
public class AReviewServiceImpl implements AReviewService {
	@Setter(onMethod_ = @Autowired)
	private AReviewDAO reviewDAO;
	
	@Setter(onMethod_ = @Autowired)
	private ARepReviewDAO repReviewDAO;
	
	@Override
	public int rvboardListCnt(AReviewVO rvo) {
		return reviewDAO.rvboardListCnt(rvo);
	}
	
	@Override
	public List<AReviewVO> boardList(AReviewVO rvo) {
		List<AReviewVO> list = reviewDAO.boardList(rvo);
		return list;
	}

	@Override
	public AReviewVO boardDetail(AReviewVO rvo) {
		AReviewVO detail = null;
		detail = reviewDAO.boardDetail(rvo);
		if(detail!=null) {
			detail.setRv_content(detail.getRv_content().toString().replaceAll("\n", "<br />"));
		}
		return detail;
	}
	
	// 댓글 개수
	@Override
	public int replyCnt(int rv_no) {
		int result = 0;
		result = repReviewDAO.replyCnt(rv_no);
		return result;
	}
	// 게시글 삭제
	@Override
	public int boardDelete(AReviewVO rvo ) {
		int result =0;
		int rv_no = rvo.getRv_no();
		
		// 해당 글 댓글 전체 삭제
		repReviewDAO.replyAllDelete(rv_no);
		// 해당 글 삭제 
		result = reviewDAO.boardDelete(rvo);
		return result;
	}

}
