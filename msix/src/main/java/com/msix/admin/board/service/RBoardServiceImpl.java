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
	public List<RBoardVO> replyList(int q_no) {
		List<RBoardVO> list = null;
		list = rboardDAO.replyList(q_no);
		return list;
	}

	@Override
	public int replyInsert(RBoardVO rvo) {
		int result =0;
		result = rboardDAO.replyInsert(rvo);
		return result;
	}

	@Override
	public int replyupdate(RBoardVO rvo) {
		int result =0;
		result = rboardDAO.replyupdate(rvo);
		return result;
	}

	@Override
	public int replyDelete(int r_no) {
		int result =0;
		result = rboardDAO.replyDelete(r_no);
		return result;
	}

	
	
	

}
