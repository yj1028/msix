package com.msix.admin.board.dao;

import java.util.List;

import com.msix.admin.board.vo.RBoardVO;


public interface RBoardDAO {
	public List<RBoardVO> replyList(int q_no);
	public int replyInsert(RBoardVO rvo);
	public int replyupdate(RBoardVO rvo);
	public int replyDelete(int r_no);
	
}
