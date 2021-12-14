package com.msix.client.ccmnt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.client.ccmnt.dao.CcmntDAO;
import com.msix.client.ccmnt.vo.CcmntVO;

import lombok.Setter;

@Service
public class CcmntSercviceImpl implements CcmntSercvice{
	@Setter(onMethod_=@Autowired )
	private CcmntDAO ccmntDAO;
	
	@Override
	public List<CcmntVO> ccmntList(int rv_no){
		List<CcmntVO> list=null;
		list =ccmntDAO.ccmntList(rv_no);
		return list;
	}
		
	@Override
	public int ccmntInsert(CcmntVO cvo) {
		int result=0;
		result=ccmntDAO.ccmntInsert(cvo);
		return result;
	}
	
	@Override
	public int ccmntUpdate(CcmntVO cvo) {
		int result=0;
		result=ccmntDAO.ccmntUpdate(cvo);
		return result;
	}
	@Override
	public int ccmntDelete(Integer c_no) {
		int result=0;
		result=ccmntDAO.ccmntDelete(c_no);
		return result;
	}
}
