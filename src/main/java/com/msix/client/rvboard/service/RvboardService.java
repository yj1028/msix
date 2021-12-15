package com.msix.client.rvboard.service;

import java.util.List;

import com.msix.client.rvboard.vo.RvboardVO;

public interface RvboardService {
	public List<RvboardVO> rvboardList(RvboardVO rvvo);
	public int rvboardListCnt(RvboardVO rvvo);
	public int rvboardInsert(RvboardVO rvvo) throws Exception ;
	public RvboardVO rvboardDetail(RvboardVO rvvo);
	public RvboardVO updateForm(RvboardVO rvvo);
	public int rvboardUpdate(RvboardVO rvvo)throws Exception ;
 	public int rvboardDelete(RvboardVO rvvo)throws Exception ;
 	public int ccmntCnt(int rv_no);
}
 