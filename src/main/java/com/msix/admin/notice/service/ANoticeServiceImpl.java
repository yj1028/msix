package com.msix.admin.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.admin.notice.dao.ANoticeDAO;
import com.msix.admin.notice.vo.ANoticeVO;

import lombok.Setter;

@Service
public class ANoticeServiceImpl implements ANoticeService {
	
	@Setter(onMethod_ = @Autowired)
	private ANoticeDAO noticeDAO;
	

	@Override
	public int nboardListCnt(ANoticeVO nvo) {
		return noticeDAO.nboardListCnt(nvo);
	}

	@Override
	public List<ANoticeVO> boardList(ANoticeVO nvo) {
		List<ANoticeVO> list = noticeDAO.boardList(nvo);
		return list;
	}
	
	@Override
	public int boardInsert(ANoticeVO nvo) {
		int result =0;
		
		result = noticeDAO.boardInsert(nvo);
		return result;
	}
	
	@Override
	public ANoticeVO boardDetail(ANoticeVO nvo) {
		ANoticeVO detail = null;
		detail = noticeDAO.boardDetail(nvo);
		if(detail!=null) {
			detail.setN_content(detail.getN_content().toString().replaceAll("\n", "<br />"));
		}	
		return detail;
	}
	
	@Override
	public int boardUpdate(ANoticeVO nvo) {
		int result =0;
		result = noticeDAO.boardUpdate(nvo);
		return result;
	}

	@Override
	public int boardDelete(ANoticeVO nvo) {
		int result =0;
		result = noticeDAO.boardDelete(nvo);
		return result;
	}

	
}
