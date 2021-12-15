package com.msix.admin.refund.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.admin.refund.dao.ARefundDAO;
import com.msix.admin.refund.vo.ARefundVO;
import com.msix.common.file.FileUploadUtil;

import lombok.Setter;

@Service
public class RefundServiceImpl implements RefundService {
	
	@Setter(onMethod_ = @Autowired)
	private ARefundDAO refundDAO;
	
	public List<ARefundVO> refundList(ARefundVO rvo){
		List<ARefundVO> list = refundDAO.refundList(rvo);
		return list;
	}
	
	public int refundListCnt(ARefundVO rvo) {
		int count = refundDAO.refundListCnt(rvo);
		return count;
	}
	
	public ARefundVO refundDetail(ARefundVO rvo) {
		ARefundVO detail = refundDAO.refundDetail(rvo);
		return detail;
	}
	
	public int refundUpdate(ARefundVO rvo) {
		
		refundDAO.refundUpdateCheck(rvo);
		
		int count = refundDAO.refundUpdate(rvo);
		return count;
	}
	
	public int refundDelete(ARefundVO rvo) {
		int result = refundDAO.refundDelete(rvo);
		return result;
	}
	
	public int refundInsert(ARefundVO rvo) throws Exception {
		int result = 0;
		
		if(rvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(rvo.getFile(), "refund");
			rvo.setRf_image(fileName);
		}
		
		refundDAO.refundCheck(rvo);
		refundDAO.refundAttrCheck(rvo);
		
		result = refundDAO.refundInsert(rvo);
		return result;
	}
}
