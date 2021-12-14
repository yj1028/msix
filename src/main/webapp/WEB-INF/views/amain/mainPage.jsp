<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>main.html</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="/resources/js/jquery-1.12.4.min.js"></script>
		
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	    <script type="text/javascript">
	      google.charts.load('current', {'packages':['corechart']});
	      google.charts.setOnLoadCallback(drawChart);
	      
	      google.charts.load('current', {'packages':['table']});
	      google.charts.setOnLoadCallback(drawTable);
	
	      function drawChart() {
			/* piechart*/
	        var data = google.visualization.arrayToDataTable([
	          ['Task', 'Hours per Day'],
	          ['양서류',     11],
	          ['거북',      2],
	          ['도마뱀',  2],
	          ['게코', 2],
	          ['사육용품',    7],
	          ['먹이',    7]
	        ]);
	
	        var options = {
	          title: '상품별 통계'
	        };
	
	        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
	
	        chart.draw(data, options);
	        
	        
	        /* barchart*/
	        var data = google.visualization.arrayToDataTable([
	            ["Element", "Density", { role: "style" } ],
	            ["배송완료", 18, "#b87333"],
	            ["배송중", 100, "silver"],
	            ["환불처리완료", 9, "gold"],
	            ["환불처리중", 10, "color: #e5e4e2"]
	          ]);

	          var view = new google.visualization.DataView(data);
	          view.setColumns([0, 1,
	                           { calc: "stringify",
	                             sourceColumn: 1,
	                             type: "string",
	                             role: "annotation" },
	                           2]);

	          var options = {
	            title: "배송처리현황",
	            width: 600,
	            height: 400,
	            bar: {groupWidth: "95%"},
	            legend: { position: "none" },
	          };
	          var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
	          chart.draw(view, options);
	          
	      }
	      
	      /* table */
	      function drawTable() {
	          var data = new google.visualization.DataTable();
	          data.addColumn('string', '회원이름');
	          data.addColumn('number', '구매총액');
	          data.addColumn('boolean', '회원탈퇴여부');
	          data.addRows([
	            ['김철수',  {v: 10000, f: '10,000'}, true],
	            ['홍길동',   {v:8000,   f: '8,000'},  false],
	            ['장영실', {v: 12500, f: '12,500'}, true],
	            ['이국종',   {v: 7000,  f: '7,000'},  true]
	          ]);

	          var table = new google.visualization.Table(document.getElementById('table_div'));

	          table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
	        }
	    </script>
	    <style type="text/css">
	    	#piechart{float: left; }
	    	#columnchart_values{float: right; }
	    	.table table-condensed{float: left; width: 300px;}
	    </style>
	</head>
	<body>
		<div id="piechart" style="width: 550px; height: 500px;"></div>
		<div id="columnchart_values" style="width: 550px; height: 300px;"></div>
		<br /><br /><br /><br /><br /><br />
		<div id="table_div"></div>
		<br /><br /><br /><br /><br /><br />
		
		<table class="table table-condensed">
			<caption>공지게시판</caption>
			<tr>
				<td>공지글 제목</td>
			</tr>
			<tr>
				<td>공지글 제목</td>
			</tr>
			<tr>
				<td>공지글 제목</td>
			</tr>
		</table>
		<table class="table table-condensed">
			<caption>리뷰게시판</caption>
			<tr>
				<td>글 제목</td>
			</tr>
			<tr>
				<td>글 제목</td>
			</tr>
			<tr>
				<td>글 제목</td>
			</tr>
		</table>
		<table class="table table-condensed">
			<caption>질의게시판</caption>
			<tr>
				<td>글 제목</td>
			</tr>
			<tr>
				<td>글 제목</td>
			</tr>
			<tr>
				<td>글 제목</td>
			</tr>
		</table>
	</body>
</html>


