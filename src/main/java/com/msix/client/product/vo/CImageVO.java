package com.msix.client.product.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class CImageVO {
	private int i_no;
	private String p_no;
	private String i_name;
	private String i_thumb;
	private String i_date;
	
}
