package com.msix.admin.review.dao;

import java.util.List;

import com.msix.admin.review.vo.RepReviewVO;

public interface RepReviewDAO {
	public List<RepReviewVO> replyList(Integer rv_no);
	public int replyCnt(int rv_no);			//게시글 댓글 개수 (ReviewDAO 에서 사용)
	public int replyEachDelete(int c_no);	//선택된 댓글 삭제
	public int replyAllDelete(int rv_no);	//해당 게시글의 댓글 모두 삭제 (ReviewDAO 에서 사용)
}
