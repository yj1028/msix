package com.msix.client.rboard.dao;

import java.util.List;

import com.msix.client.rboard.vo.RboardVO;

public interface RboardDAO {
	
	public List<RboardVO> rboardList(int q_no);
	public int rboardDelete(int q_vo);
	
}
