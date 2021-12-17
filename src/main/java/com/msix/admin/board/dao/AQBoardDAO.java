package com.msix.admin.board.dao;

import java.util.List;
import java.util.Map;

import com.msix.admin.board.vo.AQBoardVO;

public interface AQBoardDAO {
	public int qboardListCnt(AQBoardVO qvo);
	public List<AQBoardVO> boardList(AQBoardVO qvo);
	public AQBoardVO boardDetail(AQBoardVO qvo);
	public int boardDelete(AQBoardVO qvo);
	
	public Map<Integer,String> selectStatsBoard();
}
