package com.msix.admin.board.service;

import java.util.List;

import com.msix.admin.board.vo.AQBoardVO;

public interface AQBoardService {
	public int qboardListCnt(AQBoardVO qvo);
	public List<AQBoardVO> boardList(AQBoardVO qvo);
	public AQBoardVO boardDetail(AQBoardVO qvo);
	public int boardDelete(AQBoardVO qvo);
	
}
