package com.msix.client.nbaord.service;

import java.util.List;

import com.msix.client.nbaord.vo.NboardVO;

public interface NboardService {
	public List<NboardVO> nboardList(NboardVO nvo);
	public int nboardListCnt(NboardVO nvo);
	public NboardVO nboardDetail(NboardVO nvo);

}
