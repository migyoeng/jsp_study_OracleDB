<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>uploadTest_파일첨부</title>
</head>
<body>
	<h3>파일 첨부 테스트</h3>
	<!-- http://pretyimo.cafe24.com/lectureRead.do?lectureno=409 -->
	<!-- 파일 첨부는 GET 방식으로 전송이 불가능하다 -->
	
	<!-- method 생략 시 GET -->
	<!-- enctype으로 인해 input에 데이터를 입력하여 전송해도 null이 출력된다 -->
	<!-- enctype을 지우고 input에 데이터를 입력하여 전송하면 입력한 값이 출력되지만 첨부한 파일은 파일명이 String 타입으로만 전송되어 출력된다-->
	<form method="POST" action="uploadProc.jsp" enctype="multipart/form-data">
		이름: <input type="text" name="uname"> <br>
		제목: <input type="text" name="subject"> <br>
		내용: <textarea rows="5" cols="20" name="content"></textarea> <br>
		첨부: <input type="file" name="filenm"> <br>
		<input type="submit" value="전송">
	</form>
</body>
</html>