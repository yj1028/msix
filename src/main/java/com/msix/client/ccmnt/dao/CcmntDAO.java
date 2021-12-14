package com.msix.client.ccmnt.dao;

import java.util.List;

import com.msix.client.ccmnt.vo.CcmntVO;

public interface CcmntDAO {
	public List<CcmntVO> ccmntList(int rv_no);
	public int ccmntInsert(CcmntVO cvo);
	public int ccmntUpdate(CcmntVO cvo);
	public int ccmntDelete(Integer c_no);
	public int ccmntCnt(int rv_no);
	public int rvccmntDelete(int rv_vo);
}
