package com.msix.admin.board.service;

import java.util.List;

import com.msix.admin.board.vo.RBoardVO;

public interface RBoardService {
	public List<RBoardVO> replyList(int r_no);
	public int replyInsert(RBoardVO rvo);
	public int replyupdate(RBoardVO rvo);
	public int replyDelete(int r_no);
}
