package com.msix.admin.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.admin.notice.dao.NoticeDAO;
import com.msix.admin.notice.vo.NoticeVO;

import lombok.Setter;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Setter(onMethod_ = @Autowired)
	private NoticeDAO noticeDAO;
	

	@Override
	public int nboardListCnt(NoticeVO nvo) {
		return noticeDAO.nboardListCnt(nvo);
	}

	@Override
	public List<NoticeVO> boardList(NoticeVO nvo) {
		List<NoticeVO> list = noticeDAO.boardList(nvo);
		return list;
	}
	
	@Override
	public int boardInsert(NoticeVO nvo) {
		int result =0;
		
		result = noticeDAO.boardInsert(nvo);
		return result;
	}
	
	@Override
	public NoticeVO boardDetail(NoticeVO nvo) {
		NoticeVO detail = null;
		detail = noticeDAO.boardDetail(nvo);
		if(detail!=null) {
			detail.setN_content(detail.getN_content().toString().replaceAll("\n", "<br />"));
		}	
		return detail;
	}
	
	@Override
	public int boardUpdate(NoticeVO nvo) {
		int result =0;
		result = noticeDAO.boardUpdate(nvo);
		return result;
	}

	@Override
	public int boardDelete(NoticeVO nvo) {
		int result =0;
		result = noticeDAO.boardDelete(nvo);
		return result;
	}

	
}
