package com.msix.admin.board.dao;

import java.util.List;

import com.msix.admin.board.vo.QBoardVO;

public interface QBoardDAO {
	public int qboardListCnt(QBoardVO qvo);
	public List<QBoardVO> boardList(QBoardVO qvo);
	public QBoardVO boardDetail(QBoardVO qvo);
	
}
