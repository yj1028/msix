package com.msix.admin.notice.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeVO {
	private int n_no;	//primary key
	private String n_title;
	private String n_content;
	private String date;
	private int n_cnt =0;
	
}
