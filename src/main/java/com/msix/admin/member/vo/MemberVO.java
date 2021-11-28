package com.msix.admin.member.vo;

import lombok.Data;

@Data
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