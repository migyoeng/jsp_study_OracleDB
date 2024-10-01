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
	      <!-- http://localhost:9090/basic06_myweb/index2.jsp
	      	   실제 도메인 주소로 바뀌어야 한다(# 위치)-->
	      <a class="navbar-brand" href="<%=request.getContextPath() %>/index.jsp">HOME</a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="../bbs/bbsList.jsp">게시판</a></li>
	        <li><a href="../notice/noticeList.jsp">공지사항</a></li>
	        <li><a href="../member/loginForm.jsp">로그인</a></li>
	        <li><a href="../pds/pdsList">포토갤러리</a></li>
	        <li><a href="../mail/mailForm.jsp">메일보내기</a></li>
	      </ul>
	    </div>
	  </div>
	</nav><!-- 메인 카테고리 끝 -->
	
	<!-- Second Container -->
	<div class="container-fluid bg-3 text-center">    
	  <div class="row">
	    <div class="col-xs-12">
	        <!-- 본문 시작 -->
	
	        <!-- 본문 끝 -->
	    </div><!-- col-xs-12 end -->
	  </div><!-- row end -->
	</div><!-- Second Container end -->
	
	<!-- Footer -->
	<footer class="container-fluid bg-4 text-center">
	    Copyright &copy; 2024 MyWeb
	</footer>

</body>
</html>
