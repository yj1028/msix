package com.msix.client.rvboard.dao;

import java.util.List;

import com.msix.client.rvboard.vo.RvboardVO;


public interface RvboardDAO {
	public List<RvboardVO> rvboardList(RvboardVO rvvo);
	public int rvboardListCnt(RvboardVO rvvo);
	public int rvboardInsert(RvboardVO rvvo);
	public RvboardVO rvboardDetail(RvboardVO rvvo);
	public int rvboardUpdate(RvboardVO rvvo);
	public int rvboardDelete(RvboardVO rvvo);
	public void RvcntUpdate(RvboardVO rvvo);
}
