package com.msix.client.rboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.client.rboard.dao.RboardDAO;
import com.msix.client.rboard.vo.RboardVO;

import lombok.Setter;

@Service
public class RboardServiceImpl implements RboardService{
	@Setter(onMethod_=@Autowired )
	private RboardDAO rboardDAO;
	
	@Override
	public List<RboardVO> rboardList(int q_no) {
		List<RboardVO> list=null;
		list =rboardDAO.rboardList(q_no);
		return list;
	}

	
}
