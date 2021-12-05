package com.msix.admin.notice.service;

import java.util.List;

import com.msix.admin.notice.vo.NoticeVO;

public interface NoticeService {
	public List<NoticeVO> boardList();
	public int boardInsert(NoticeVO nvo);
	public NoticeVO boardDetail(NoticeVO nvo);
	public int boardUpdate(NoticeVO nvo);
	public int boardDelete(NoticeVO nvo);
}
