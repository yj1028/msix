package com.msix.admin.review.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVO {
	private int rv_no;	//pk
	private int m_no;	//fk
	private String rv_tag;
	private String rv_title;
	private String rv_content;
	private String rv_image;
	private String rv_date;
	private int rv_cnt;
	
}
