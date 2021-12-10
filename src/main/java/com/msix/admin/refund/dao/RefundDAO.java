package com.msix.admin.refund.dao;

import java.util.List;

import com.msix.admin.refund.vo.RefundVO;

public interface RefundDAO {
	public List<RefundVO> refundList(RefundVO rvo);
	public int refundListCnt(RefundVO rvo);
	public RefundVO refundDetail(RefundVO rvo);
	public int refundUpdate(RefundVO rvo);
	public int refundDelete(RefundVO rvo);
	public int refundInsert(RefundVO rvo);
	public int refundUpdateCheck(RefundVO rvo);
}
