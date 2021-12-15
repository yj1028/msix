package com.msix.client.nbaord.vo;

import com.msix.client.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class NboardVO extends CommonVO {
	
	private int n_no=0;
	private String n_title="";
	private String n_content="";
	private String n_date="";
	private int n_cnt=0;
}
