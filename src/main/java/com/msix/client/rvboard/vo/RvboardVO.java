package com.msix.client.rvboard.vo;

import org.springframework.web.multipart.MultipartFile;

import com.msix.client.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class RvboardVO  extends CommonVO{
	private int rv_no=0;
	private int m_no=0;
	private String rv_tag="";
	private String rv_title="";
	private String rv_content="";
	private String rv_image="";
	private String rv_date="";
	private int rv_cnt=0;
	private String m_name="";

	private int c_cnt=0;
	private MultipartFile file;
}
