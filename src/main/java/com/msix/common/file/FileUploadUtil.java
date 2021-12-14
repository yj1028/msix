package com.msix.common.file;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
public class FileUploadUtil {
	/* FileUploadUtil 클래스의 모든 메서드는 정적 메서드로 정의한다. 접근방법 : 클래스명.메서드명() */
	/* 파일 업로드할 폴더 생성 */
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if(fileDir.exists()) {
			return;
		}
		fileDir.mkdirs();
	}
	
	/* 파일 업로드 메서드
	 * 파일명이 중복시 해결 방법
	 * System.currentTimeMillis()를 사용하거나 UUID는 128비트의 수이다.
	 * 표준 형식에서 UUID는 32개의 16진수로 표현되며 총 36개의 문자(32개의 문자와 4개의 하이픈)로
	 * 된 8-4-4-4-12라는 5개의 그룹을 하이픈으로 구분한다. 이를테면 다음과 같다.
	 * 이때 UUID.randomUUID().toString()를 이용해서 얻는다.
	 * 50e84000-e29b-41d4-a716-446655440000
	 * */
	public static String fileUpload(MultipartFile file, String fileName) throws IOException{
		log.info("fileUpload 호출 성공");
		
		String real_name = null;
		// MultipartFile 클래스의 getFile() 메서드로 클라이언트가 업로드한 파일
		String org_name = file.getOriginalFilename();
		log.info("org_name : " + org_name);
		
		// 파일명 변경(중복되지 않게)
		if(org_name != null && (!org_name.equals(""))) {
			real_name = fileName + "_" + System.currentTimeMillis() + "_" + org_name; // 저장할 파일 이름
			
			String docRoot = "C://uploadStorage//"+fileName; // 폴더 생성
			makeDir(docRoot);
			
			File fileAdd = new File(docRoot+"/"+real_name); // 파일 생성후
			log.info("업로드할 파일(fileAdd) : " + fileAdd);
			
			file.transferTo(fileAdd);
		}
		return real_name;
	}
	
	/* 파일 삭제 메서드 */
	public static void fileDelete(String fileName) throws IOException{
		log.info("fileDelete 호출 성공 ");
		boolean result = false;
		String startDirName = "", docRoot = "";
		String dirName = fileName.substring(0, fileName.indexOf("_")); // board_1637885744954_cat.png, thumbnail_board_1637885744954_cat.png
		
		if(dirName.equals("thumbnail")) {
			startDirName = fileName.substring(dirName.length()+1, fileName.indexOf("_", dirName.length()+1));
			docRoot = "C://uploadStorage//"+startDirName+"//"+dirName;
		}else {
			docRoot = "C://uploadStorage//"+dirName;
		}
		
		File fileDelete = new File(docRoot+"/"+fileName); // 파일 객체 생성
		log.info("삭제할 파일(fileDelete) : " + fileDelete);
		if(fileDelete.exists() && fileDelete.isFile()) { // fileDelete가 존재해야 하고 폴더가 아닌 파일이어야 한다
			result = fileDelete.delete();
		}
		log.info("파일 삭제 여부(true/false) : " + result);
	}
	
	/* 파일 Thumbnail 생성 메서드 */
	public static String makeThumbnail(String fileName) throws Exception{
		String dirName = fileName.substring(0, fileName.indexOf("_")); // 이미지가 존재하는 폴더 추출
		// 추출된 폴더의 실제 경로(물리적 위치 : C:\...)
		String imgPath = "C://uploadStorage//"+dirName; // C://uploadStorage//board
		File fileAdd = new File(imgPath, fileName);  // C://uploadStorage//board/board_0000000_a.gif
		log.info("원본 이미지 파일(fileAdd) : " + fileAdd);
		
		BufferedImage sourceImg = ImageIO.read(fileAdd);
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 200);
		// resize(대상[BufferedImage 타입], 원본비율, 높이 또는 너비, 크기)
		
		String thumbnailName = "thumbnail_"+fileName; // thumbnail_board_0000000_a.gif
		String docRoot = imgPath+"/thumbnail"; // C://uploadStorage//board//thumbnail//thumbnail_board_0000000_a.gif
		makeDir(docRoot);
		
		File newFile = new File(docRoot, thumbnailName);
		log.info("업로드할 파일(newFile) : " + newFile);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		log.info("확장자(formatName) : " + formatName);
		
		ImageIO.write(destImg, formatName, newFile);
		
		return thumbnailName;
	}
}
