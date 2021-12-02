package com.msix.admin.board.dao;

import java.util.List;

import com.msix.admin.board.vo.QBoardVO;

public interface QBoardDAO {
	public List<QBoardVO> boardList();
	public QBoardVO boardDetail(QBoardVO qvo);
	
	
}
