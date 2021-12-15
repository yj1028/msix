package com.msix.client.nbaord.dao;

import java.util.List;

import com.msix.client.nbaord.vo.NboardVO;

public interface NboardDAO {
	public List<NboardVO> nboardList(NboardVO nvo);
	public int nboardListCnt(NboardVO nvo);
	public NboardVO nboardDetail(NboardVO nvo);
	public void cntUpdate(NboardVO nvo);
}
