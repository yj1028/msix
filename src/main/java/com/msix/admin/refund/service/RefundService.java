package com.msix.admin.refund.service;

import java.util.List;

import com.msix.admin.refund.vo.ARefundVO;

public interface RefundService {
	public List<ARefundVO> refundList(ARefundVO rvo);
	public int refundListCnt(ARefundVO rvo);
	public ARefundVO refundDetail(ARefundVO rvo);
	public int refundUpdate(ARefundVO rvo);
	public int refundDelete(ARefundVO rvo);
	public int refundInsert(ARefundVO rvo) throws Exception;
}
