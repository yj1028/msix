package com.spring.presistence;

import java.sql.Connection;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
//spring이 아닌 JUnit으로 실행하기.
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//xml 파일의 위치값을 명시한다.
@Log4j
public class DataSourceTests {
	
	@Setter(onMethod_= @Autowired )
	private DataSource dataSource;
	
	@Setter(onMethod_ =@Autowired )
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testConnection() {

		try(Connection con=dataSource.getConnection()){
			log.info(con);
			log.info("---------------------------");
			log.info("데이터베이스에 정상적으로 연결되었습니다.");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testMybatis() {
		try(SqlSession session = sqlSessionFactory.openSession();
			//session 인터페이스이기 때문에 openSession으로 객체 얻어옴.
			Connection con = session.getConnection(); ){
			log.info(session);
			log.info(con);
			log.info("------------------------");
			log.info("Mybatis 연동 성공!");
		}catch(Exception e) {
				e.printStackTrace();
		}
	}
}
