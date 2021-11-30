package com.spring.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.example.domain.SubjectVO;
import com.spring.mapper.TimeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TimeMapperTests {
	@Setter(onMethod_ = @Autowired)
	private TimeMapper timeMapper;
	
	public void testGetTime() {
		log.info(timeMapper.getClass().getName());
		log.info("getTime() 메서드 실행");
		log.info(timeMapper.getTime());
		
	}
	
	public void testGetNum() {
		log.info("getNum()메서드 실행");
		log.info(timeMapper.getNum());
	}
	
	
	public void getTime2() {
		log.info(timeMapper.getTime2());
	}
	
	
	public void getSubjectName() {
		log.info(timeMapper.getSubjectName("07"));
		
	}
	
	
	public void getSubjects() {
		log.info(timeMapper.getSubjects(0));
		
		List<SubjectVO> list = timeMapper.getSubjects(0);
		for(SubjectVO vo : list) {
			log.info(vo);
		}
	}
	
	
	public void subjectInsert() {
		log.info(timeMapper.subjectInsert(new SubjectVO(0, "14","테스팅학과")));
	}
	
	
	public void subjectUpdate() {
		log.info(timeMapper.subjectUpdate(new SubjectVO(13,"15","테스텀학과")));
	}
	
	@Test
	public void subjectDelete() {
		SubjectVO vo = new SubjectVO();
		vo.setNo(13);
		log.info(timeMapper.subjectDelete(vo));
	}
	
}
