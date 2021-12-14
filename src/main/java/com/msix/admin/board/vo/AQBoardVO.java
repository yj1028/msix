package com.msix.admin.board.vo;

import com.msix.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper=false)
public class AQBoardVO extends CommonVO{
	private int q_no;	// primary key
	private int m_no;	// foreign key member(m_no)
	private String q_tag;
	private String q_title;
	private String q_content;
	private String q_date;
	private int q_cnt =0;
	
}
