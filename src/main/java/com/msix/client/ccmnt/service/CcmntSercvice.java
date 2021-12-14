package com.msix.client.ccmnt.service;

import java.util.List;

import com.msix.client.ccmnt.vo.CcmntVO;

public interface CcmntSercvice {
	public List<CcmntVO> ccmntList(int rv_no);
	public int ccmntInsert(CcmntVO cvo);
	public int ccmntUpdate(CcmntVO cvo);
	public int ccmntDelete(Integer c_no);
}