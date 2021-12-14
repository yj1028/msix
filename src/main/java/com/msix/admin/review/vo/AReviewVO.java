package com.msix.admin.review.vo;

import com.msix.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper=false)
public class AReviewVO extends CommonVO{
	private int rv_no;	//pk
	private int m_no;	//fk
	private String rv_tag;
	private String rv_title;
	private String rv_content;
	private String rv_image;
	private String rv_date;
	private int rv_cnt;
	
}
