package com.msix.admin.refund.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.admin.refund.dao.RefundDAO;
import com.msix.admin.refund.vo.RefundVO;
import com.msix.common.file.FileUploadUtil;

import lombok.Setter;

@Service
public class RefundServiceImpl implements RefundService {
	
	@Setter(onMethod_ = @Autowired)
	private RefundDAO refundDAO;
	
	public List<RefundVO> refundList(RefundVO rvo){
		List<RefundVO> list = refundDAO.refundList(rvo);
		return list;
	}
	
	public int refundListCnt(RefundVO rvo) {
		int count = refundDAO.refundListCnt(rvo);
		return count;
	}
	
	public RefundVO refundDetail(RefundVO rvo) {
		RefundVO detail = refundDAO.refundDetail(rvo);
		return detail;
	}
	
	public int refundUpdate(RefundVO rvo) {
		
		refundDAO.refundUpdateCheck(rvo);
		
		int count = refundDAO.refundUpdate(rvo);
		return count;
	}
	
	public int refundDelete(RefundVO rvo) {
		int result = refundDAO.refundDelete(rvo);
		return result;
	}
	
	public int refundInsert(RefundVO rvo) throws Exception {
		int result = 0;
		
		if(rvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(rvo.getFile(), "refund");
			rvo.setRf_image(fileName);
		}
		
		result = refundDAO.refundInsert(rvo);
		return result;
	}
}
