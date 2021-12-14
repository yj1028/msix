package com.msix.admin.board.service;

import java.util.List;

import com.msix.admin.board.vo.ARBoardVO;

public interface ARBoardService {
	public List<ARBoardVO> replyList(int q_no);
	public int replyInsert(ARBoardVO rvo);
	public int replyupdate(ARBoardVO rvo);
	public int replyDelete(int r_no);
	
}
