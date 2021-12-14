package com.msix.client.nbaord.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.client.nbaord.dao.NboardDAO;
import com.msix.client.nbaord.vo.NboardVO;

import lombok.Setter;

@Service
public class NboardServiceImpl implements NboardService {
		@Setter(onMethod_= @Autowired)
		private NboardDAO nboardDAO;
		
		//공지리스트 구현
		@Override
		public List<NboardVO> nboardList(NboardVO nvo){
			List<NboardVO> list=null;
			list = nboardDAO.nboardList(nvo);
			return list;
		}
		
		//전체 레코드 수 구현
		@Override
		public int nboardListCnt(NboardVO nvo){
			return nboardDAO.nboardListCnt(nvo);
		}
		
		//공지글상세 구현
		@Override
		public NboardVO nboardDetail(NboardVO nvo ) {
			nboardDAO.cntUpdate(nvo);
			NboardVO detail=null;
			detail= nboardDAO.nboardDetail(nvo);
			if(detail !=null) {
				detail.setN_content(detail.getN_content().toString().replaceAll("\n", "<br>"));
			}
			return detail;
		}
}
