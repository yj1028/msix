package com.msix.admin.board.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RBoardVO {
	private int r_no;	//primary key
	private int q_no;	//foreign key q_board(q_no)
	private String r_title;
	private String r_content;
	private String r_date;
	private int r_cnt;
}
