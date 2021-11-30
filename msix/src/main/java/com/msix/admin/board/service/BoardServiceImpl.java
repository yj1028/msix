package com.msix.admin.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.admin.board.dao.BoardDAO;
import com.msix.admin.board.vo.BoardVO;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardDAO boardDAO;
	
	//질의게시판 리스트
	@Override
	public List<BoardVO> boardList() {
		List<BoardVO> list = boardDAO.boardList();
		return list;
	}

}
