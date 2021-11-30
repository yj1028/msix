package com.spring.presistence;

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

	@Test
	public void testGetTime() {
		/*
		 * log.info("-----------------------");
		 * log.info(timeMapper.getClass().getName());
		 */
		
		 /* 
		 * TimeMapper인터페이스에 대한 구현클래스가 mybatis에서 자동생성되기 때문에 getClass()는 구현클래스의 주소를 불러온다.
		 */
		
		/*
		 * log.info("getTime() 메서드 실행"); 
		 * log.info(timeMapper.getTime());
		 */
		
		/* 
		 * log.info("-------------------------"); log.info("첫번째 작성자명");
		 * log.info(timeMapper.getAuthor());
		 */
		
		 /* 
		 * log.info("-------------------------"); log.info("오늘 날짜");
		 * log.info(timeMapper.getTime2());
		 */
		
		/* log.info("-----------------------------");
		log.info("Subject 테이블의 데이터 조회");
		log.info("getSubjectName() 메서드 실행");
		log.info(timeMapper.getSubjectName("02")); */
		
		//log.info("---------------------------------");
		//log.info("Subject 테이블 전체 데이터 조회하기");
		
		/* VO에 데이터를 담아오고 mybatis에서 list클래스를 만들어준다. 
		 * 객체 생성을 자동으로 해준다.
		만들어진 클래스로 timeMapper메서드 주솟값을 얻어옴.
		 */
		
		//List<SubjectVO> list = new ArrayList<>();
		/* for(int i=0; i<list.size(); i++){
		SubjectVO vo = list.get(i);를 확장 for문으로 */
		 List<SubjectVO> list = timeMapper.getSubjects(0);
		//담을 수 있는 변수는 vo, list.get(0)번째부터 원소 수만큼 반복.
		for(SubjectVO vo : list) {
			log.info(vo);
		} 
		
		/*log.info("----------------------");
		log.info("subjectInsert() 메서드 실행");
		SubjectVO svo = new SubjectVO();
		//값을 담을 VO 객체를 생성하고, 값을 설정한다. 
		svo.setNo(0);
		svo.setS_num("08");
		svo.setS_name("식품영양학과");
		//메서드 안에 값을 담은 svo를 불러서 출력해야함.
		log.info(timeMapper.subjectInsert(svo));*/	
		
		/* 수정, 삭제를 실행하게 되면 인서트는 주석을 주어야함. */
	}
	
	@Test
	public void testData() {
		/*log.info("subjectUpdate() 메서드 실행해보기");
		SubjectVO svo = new SubjectVO();
		svo.setNo(5);
		svo.setS_num("12");//num은 유일값이기 때문에 변경 대상에서 제외됨.
		svo.setS_name("문학창작과");
		
		log.info(timeMapper.subjectUpdate(svo));*/
		
		log.info("subjectDelete() 메서드 실행해보기");
		SubjectVO svo = new SubjectVO();
		svo.setNo(5);
		
		log.info(timeMapper.subjectDelete(svo));
	}
}

