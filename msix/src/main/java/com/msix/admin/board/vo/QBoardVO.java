package com.msix.admin.board.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QBoardVO {
	private int q_no;	// primary key
	private int m_no;	// foreign key member(m_no)
	private String q_tag;
	private String q_title;
	private String q_content;
	private String q_date;
	private int q_cnt;
	
}
