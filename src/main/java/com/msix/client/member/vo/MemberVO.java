package com.msix.client.member.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
	private int m_no;
	private String m_id;
	private String m_pwd;
	private String m_name;
	private String m_tel;
	private String m_email;
	private String m_date;
	private String m_udate;
	private String m_isdelete;
}
