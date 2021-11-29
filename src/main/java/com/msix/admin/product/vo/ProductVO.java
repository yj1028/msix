package com.msix.admin.product.vo;

import com.msix.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class ProductVO extends CommonVO{
	private String p_no = "";
	private String p_type = "";
	private String p_name = "";
	private String p_price = "";
	private int p_cnt = 0;
	private String p_info = "";
	private String p_date;
	private String p_udate;
	private String p_isdelete;
	
}
