<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정.-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->   	
		<meta charset="UTF-8">
		
		<title>boardQNA</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css">
		
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap-theme.min.css">
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script>
			
		</script>
	</head>
	<body>
	<div class="container">
	 	<div class="table-height">
			<table summary="질의게시판 리스트" class="table table-striped">
				<thead>
					<tr>
						<th class="text-center">글번호</th>
						<th class="text-center">회원번호</th>
						<th class="text-center">대분류</th>
						<th class="text-center">질의글 제목</th>
						<th class="text-center">질의글 내용</th>
						<th class="text-center">작성일</th>
						<th class="text-center">조회수</th>
						<th class="text-center">상품정보분류</th>
						
					</tr>
				</thead>
				<tbody id="" class="table-striped">
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty bulleteinList}" >
							<c:forEach var="board" items="${bulleteinList}" varStatus="status">
								<tr class="text-center">
									<td>${count - status.index}</td>
									<td class="text-left">${board.q_no }</td>
									<td class="text-left">${board.m_no }</td>
									<td class="text-left">${board.q_tag }</td>
									<td class="goDetail text-left">${board.q_title }</td>
									<td class="text-left">${board.q_content }</td>
									<td class="text-left">${board.q_date }</td>
									<td class="text-left">${q_cnt }</td>
									<td class="text-left">${q_info }</td>
									
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="8" class="text-center">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
 	</div> 
    	
	</body>
</html>