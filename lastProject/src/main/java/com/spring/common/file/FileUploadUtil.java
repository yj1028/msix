package com.spring.common.file;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
public class FileUploadUtil {
	
	/* FileUploadUtil 클래스의 모든 메서드는 정적 메서드로 정의한다.*/
	/* 업로드할 폴더 생성 */
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if(fileDir.exists()) {
			return;
		}
		fileDir.mkdirs();
	}
	
	/* 파일 업로드 메서드 
	 * 파일명 중복 시 해결방법
	 * System.currentTimeMillis()를 사용하거나 UUID는 128비트의 수
	 * 표준 형식에서 UUID는 32개의 16진수로 표현되면 총 36개의 문자로 된 5개의 그룹을
	 * 하이픈으로 구분한다.
	 * UUID.randomUUID().toString()를 이용해서 얻는다. */
	public static String fileUpload(MultipartFile file, String fileName) throws IOException {
		log.info("fileUpload  호출 성공");
		String real_name = null;
		String org_name = file.getOriginalFilename();
		log.info("org_name : "+ org_name);
		
		//중복된 파일명 변경
		if(org_name != null && (!org_name.equals(""))) {
			real_name = fileName + "_" + System.currentTimeMillis() + "_" +org_name;
			
			String docRoot ="C://uploadStorage//"+fileName;
			makeDir(docRoot);
			
			File fileAdd = new File(docRoot+"/"+real_name);
			log.info("업로드할 파일(fileAdd) : " + fileAdd);
			file.transferTo(fileAdd);
		}
		return real_name;
	}
	
	/* 썸네일 파일 생성 메서드*/
	public static String makeThumbnail(String fileName) throws Exception{
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		
		String imgPath = "C://uploadStorage//"+dirName;
		File fileAdd = new File(imgPath, fileName);
		log.info("원본이미지파일(fileAdd) " +fileAdd);
		
		BufferedImage sourceImg = ImageIO.read(fileAdd);
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 133);
		
		String thumbnailName = "thumbnail_"+fileName;
		String docRoot = imgPath +"/thumbnail";
		makeDir(docRoot);
		
		File newFile = new File(docRoot, thumbnailName);
		log.info("업로드할 파일(newFile) " + newFile);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		log.info("확장자(formatName) : " + formatName);
		
		ImageIO.write(destImg, formatName, newFile);
		return thumbnailName;
		
	}
	
	/* 파일 삭제 메서드*/
	public static void fileDelete(String fileName) throws IOException {
		log.info("fileDelete 호출 ");
		boolean result = false;
		String startDirName ="", docRoot = "";
		//thumbnail
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		
		//파일명으로 경로 추출하기 위한 과정  thumbnail_board_1637886958850_bicycle1.jpg
		if(dirName.equals("thumbnail")) {
			//board
			startDirName =fileName.substring(dirName.length()+1, fileName.indexOf("_",dirName.length()+1));
			docRoot ="C://uploadStorage//"+startDirName + "//"+dirName;
			
		}else {
			docRoot="C://uploadStorage//"+dirName;
		}
		
		File fileDelete = new File(docRoot+"/"+fileName);
		log.info("삭제할 파일(fileDelete) : " +fileDelete);
		if(fileDelete.exists() && fileDelete.isFile()) {
			result = fileDelete.delete();
		}
		log.info("파일 삭제 여부 " + result);
	}
	
}
