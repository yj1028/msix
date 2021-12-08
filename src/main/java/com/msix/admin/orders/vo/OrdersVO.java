package com.msix.admin.orders.vo;

import com.msix.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class OrdersVO extends CommonVO {
	private int o_no;
	private int m_no;
	private String o_date;
	private int o_pcode;
	private String o_addr;
	private String o_daddr;
	private String o_recipient;
	private String o_rectel;
}

