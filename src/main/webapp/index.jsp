<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>My Web</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- layout.css import -->
	<link rel="stylesheet" href="./css/layout.css">
	<script src="./js/myscript.js"></script>
	
	<!--jQuery import-->
	<script src="./js/jquery-3.7.1.js"></script>
	<script src="./js/moment-with-locales.min.js"></script>
	<script>

		showtime(); //최초 함수 호출
	
		function showtime(){
		    //alert("최초 함수 호출");
		    let now = moment(); //moment.js 시작
		    let hour = now.hour();
		    let min = now.minute();
		    let sec = now.second();
		    let millisec = now.milliseconds();
		
		    //각도 계산
		    let hourDeg = (hour%12)*30 + (min/60)*30;
		    let minDeg = min*6 + (sec/60)*6;
		    let secDeg = sec*6 + (millisec/1000)*6;
		
		    //각도 적용
		    $("#hour").css("transform", "rotate(" + hourDeg + "deg)");
		    $("#min").css("transform", "rotate(" + minDeg + "deg)");
		    $("#sec").css("transform", "rotate(" + secDeg + "deg)");
		}//showtime() end
		
		//5) 1초마다 주어진 시간대로 반복 호출
		setInterval(showtime, 20);
	</script>
  
  <style></style>
</head>
<body>

	<!-- 메인 카테고리 시작 -->
	<nav class="navbar navbar-default">
	  <div class="container">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>                        
	      </button> 
	      <a class="navbar-brand" href="<%=request.getContextPath() %>/index.jsp">HOME</a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="./bbs/bbsList.jsp">게시판</a></li>
	        <li><a href="./notice/noticeList.jsp">공지사항</a></li>
	        <li><a href="./member/loginForm.jsp">로그인</a></li>
	        <li><a href="./pds/pdsList.jsp">포토갤러리</a></li>
	        <li><a href="./mail/mailForm.jsp">메일보내기</a></li>
	      </ul>
	    </div>
	  </div>
	</nav><!-- 메인 카테고리 끝 -->

	<!-- First Container -->
	<div class="container-fluid bg-3 text-center">    
	  <div class="row">
	    <div class="col-xs-12">
	        <!-- 본문 시작 -->
				<div id="wrap">
	                <div id="clock"> <!--시계 전체 원형 이미지-->
	                    <div id="hour" class="hand"></div><!--시침 이미지-->
	                    <div id="min" class="hand"></div><!--분침 이미지-->
	                    <div id="sec" class="hand"></div><!--초침 이미지-->
	                </div>
	            </div>
	        <!-- 본문 끝 -->
	    </div><!-- col-xs-12 end -->
	  </div><!-- row end -->
	</div><!-- First Container end -->
	
	<!-- Second Container -->
	<div class="container-fluid bg-1 text-center">
	  <img src="./images/01bbo.jpg" class="img-fluid img-circle margin" style="display:inline" alt="김뽀뽀1">
	  <img src="./images/02bbo.jpg" class="img-fluid img-circle margin" style="display:inline" alt="김뽀뽀2">
	  <img src="./images/03bbo.jpg" class="img-fluid img-circle margin" style="display:inline" alt="김뽀뽀3">
	</div><!-- Second Container end -->
	
	
	<!-- Footer -->
	<footer class="container-fluid bg-4 text-center footer-box">
	    Copyright &copy; 2024 MyWeb
	</footer>

</body>
</html>
