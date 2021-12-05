package com.msix.admin.review.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RepReviewVO {
	private int c_no;	//pk
	private int rv_no;	//fk
	private String c_comment;
	private String c_date;
	
}
