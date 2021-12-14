package com.msix.admin.refund.dao;

import java.util.List;

import com.msix.admin.refund.vo.ARefundVO;

public interface ARefundDAO {
	public List<ARefundVO> refundList(ARefundVO rvo);
	public int refundListCnt(ARefundVO rvo);
	public ARefundVO refundDetail(ARefundVO rvo);
	public int refundUpdate(ARefundVO rvo);
	public int refundDelete(ARefundVO rvo);
	public int refundInsert(ARefundVO rvo);
	public int refundUpdateCheck(ARefundVO rvo);
	public int refundCheck(ARefundVO rvo);
}
