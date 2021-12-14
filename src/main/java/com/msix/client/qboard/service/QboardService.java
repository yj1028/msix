package com.msix.client.qboard.service;

import java.util.List;

import com.msix.client.qboard.vo.QboardVO;

public interface QboardService {
	 public List<QboardVO> qboardList(QboardVO qvo);
	 public int qboardListCnt(QboardVO qvo);
	 public int qboardInsert(QboardVO qvo);
	 public QboardVO qboardDetail(QboardVO qvo);
	 public QboardVO updateForm(QboardVO vo);
	 public int qboardUpdate(QboardVO qvo);
	 public int qboardDelete(QboardVO qvo);
	
	 
}
