package com.msix.admin.board.service;

import java.util.List;

import com.msix.admin.board.vo.QBoardVO;

public interface QBoardService {
	public int qboardListCnt(QBoardVO qvo);
	public List<QBoardVO> boardList(QBoardVO qvo);
	public QBoardVO boardDetail(QBoardVO qvo);
	
}
