package com.msix.admin.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.admin.board.dao.ARBoardDAO;
import com.msix.admin.board.vo.ARBoardVO;

import lombok.Setter;

@Service
public class ARBoardServiceImpl implements ARBoardService {
	
	@Setter(onMethod_ = @Autowired)
	private ARBoardDAO rboardDAO;

	@Override
	public List<ARBoardVO> replyList(int q_no) {
		List<ARBoardVO> list = null;
		list = rboardDAO.replyList(q_no);
		return list;
	}

	@Override
	public int replyInsert(ARBoardVO rvo) {
		int result =0;
		result = rboardDAO.replyInsert(rvo);
		return result;
	}

	@Override
	public int replyupdate(ARBoardVO rvo) {
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