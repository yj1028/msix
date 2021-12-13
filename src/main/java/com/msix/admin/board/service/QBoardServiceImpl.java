package com.msix.admin.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.admin.board.dao.QBoardDAO;
import com.msix.admin.board.vo.AQBoardVO;

import lombok.Setter;

@Service
public class QBoardServiceImpl implements QBoardService {
	
	@Setter(onMethod_ = @Autowired)
	private QBoardDAO qboardDAO;
	
	//질의게시판 리스트
	@Override
	public List<AQBoardVO> boardList(AQBoardVO qvo) {
		List<AQBoardVO> list = qboardDAO.boardList(qvo);
		return list;
	}
	
	//질의게시판 상세리스트
	@Override
	public AQBoardVO boardDetail(AQBoardVO qvo) {
		AQBoardVO detail = null;
		detail = qboardDAO.boardDetail(qvo);
		if(detail!=null) {
			detail.setQ_content(detail.getQ_content().toString().replaceAll("\n", "<br />"));
		}
		return detail;
	}

	@Override
	public int qboardListCnt(AQBoardVO qvo) {
		return qboardDAO.qboardListCnt(qvo);
	}

	@Override
	public int boardDelete(AQBoardVO qvo) {
		int result =0;
		result = qboardDAO.boardDelete(qvo);
		return result;
	}


}
