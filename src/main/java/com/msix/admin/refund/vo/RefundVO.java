package com.msix.admin.refund.vo;

import com.msix.admin.orders.vo.OrderDetailVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class RefundVO extends OrderDetailVO {
	private int rf_no;
	private int d_no;
	private String rf_title;
	private String rf_reason;
	private String rf_image;
	private String rf_date;
	private int rf_total;
}