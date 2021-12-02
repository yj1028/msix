package com.msix.admin.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.admin.board.dao.RBoardDAO;
import com.msix.admin.board.vo.RBoardVO;

import lombok.Setter;

@Service
public class RBoardServiceImpl implements RBoardService {
	
	@Setter(onMethod_ = @Autowired)
	private RBoardDAO rboardDAO;

	@Override
	public List<RBoardVO> replyList(int r_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyInsert(RBoardVO rvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int replyupdate(RBoardVO rvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int replyDelete(int r_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	

}
