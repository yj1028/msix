package com.msix.admin.notice.dao;

import java.util.List;

import com.msix.admin.notice.vo.NoticeVO;

public interface NoticeDAO {
	public int nboardListCnt(NoticeVO nvo);
	public List<NoticeVO> boardList(NoticeVO nvo);
	public int boardInsert(NoticeVO nvo);
	public NoticeVO boardDetail(NoticeVO nvo);
	public int boardUpdate(NoticeVO nvo);
	public int boardDelete(NoticeVO nvo);
	
}
