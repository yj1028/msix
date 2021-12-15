package com.msix.admin.notice.vo;

import com.msix.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper=false)
public class ANoticeVO extends CommonVO{
	private int n_no;	//primary key
	private String n_title;
	private String n_content;
	private String n_date;
	private int n_cnt =0;
	
}
