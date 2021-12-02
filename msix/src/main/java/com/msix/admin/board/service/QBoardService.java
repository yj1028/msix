package com.msix.admin.board.service;

import java.util.List;

import com.msix.admin.board.vo.QBoardVO;

public interface QBoardService {
	public List<QBoardVO> boardList();
	public QBoardVO boardDetail(QBoardVO qvo);
	
}
