package com.msix.client.qboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.client.qboard.dao.QboardDAO;
import com.msix.client.qboard.vo.QboardVO;
import com.msix.client.rboard.dao.RboardDAO;

import lombok.Setter;

@Service
public class QboardServiceImpl implements QboardService{
	@Setter(onMethod_=@Autowired)
	private QboardDAO qboardDAO;
	
	@Setter(onMethod_=@Autowired)
	private RboardDAO rboardDAO;
	
	//글목록 구현
	@Override
	public List<QboardVO> qboardList(QboardVO qvo){
		List<QboardVO> list=null;
		list=qboardDAO.qboardList(qvo);
		return list;
	}	
	//전체 레코드 수 조회
	@Override	
	public int qboardListCnt(QboardVO qvo) {
		return qboardDAO.qboardListCnt(qvo);
	
	}
	//글입력 구현
	@Override
	public int qboardInsert(QboardVO qvo) {
		int result=0;
		result=qboardDAO.qboardInsert(qvo);
		return result;
	}
	//글상세
	@Override
	public QboardVO qboardDetail(QboardVO qvo) {
		qboardDAO.QcntUpdate(qvo);
		QboardVO detail=null;
		detail=qboardDAO.qboardDetail(qvo);
		if(detail!=null) {
			detail.setQ_content(detail.getQ_content().toString().replaceAll("\n", "<br />"));
		}
		return detail;
	}
	//수정폼으로 이동하기
	@Override
	public QboardVO updateForm(QboardVO qvo) {
		QboardVO update=null;
		update =qboardDAO.qboardDetail(qvo);
		return update;
	}
	//글수정 구현하기 
	@Override
	public int qboardUpdate(QboardVO qvo) {
		int result=0;
		result=qboardDAO.qboardUpdate(qvo);
		return result;
	}
	//글삭제 
	@Override
	public int qboardDelete(QboardVO qvo) {
		int result=0;
		rboardDAO.rboardDelete(qvo.getQ_no());
		result=qboardDAO.qboardDelete(qvo);
		return result;
	} 
	
	
	
}
