package com.msix.admin.notice.dao;

import java.util.List;

import com.msix.admin.notice.vo.ANoticeVO;

public interface ANoticeDAO {
	public int nboardListCnt(ANoticeVO nvo);
	public List<ANoticeVO> boardList(ANoticeVO nvo);
	public int boardInsert(ANoticeVO nvo);
	public ANoticeVO boardDetail(ANoticeVO nvo);
	public int boardUpdate(ANoticeVO nvo);
	public int boardDelete(ANoticeVO nvo);
	
}
