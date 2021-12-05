package com.spring.client.board.vo;

import org.springframework.web.multipart.MultipartFile;

import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

/*@Data
@NoArgsConstructor
@AllArgsConstructor*/

/* equals와 hashCode 메소드 자동 생성시 부모 클래스의 필드까지 감안할지 안 할지에 대해서 설정시
 * callSuper = true로 설정하면 부모 클래스 필드 값들도 동일 한지 체크하며,
 * callSuper = false로 설정(기본값)하면 자신 클래스의 필드 값들만 고려한다*/

@Data
@EqualsAndHashCode(callSuper = false)
public class BoardVO extends CommonVO{
	private int b_num = 0;         // 게시판 번호
	private String b_name = "";    // 게시판 작성자
	private String b_title = "";   // 게시판 제목
	private String b_content = ""; // 게시판 내용
	private String b_pwd = "";     // 게시판 비밀번호
	private String b_date;         // 게시판 작성일
	private int r_cnt =0;			// 댓글 개수
	
	private MultipartFile file;
	private String b_thumb;
	private String b_file;
}
