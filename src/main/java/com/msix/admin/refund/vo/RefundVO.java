package com.msix.admin.refund.vo;

import org.springframework.web.multipart.MultipartFile;

import com.msix.admin.orders.vo.OrderDetailVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class RefundVO extends OrderDetailVO {
	private int rf_no;
	private int d_no;
	private String rf_title;
	private String rf_reason;
	private String rf_image;
	private String rf_date;
	private int rf_total;
	private String rf_isrefund;
	
	private MultipartFile file;
}