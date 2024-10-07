<%@page import="net.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>idCheckProc</title>
	<!-- jQuery -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<style>
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
		@import url('https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&family=Stylish&display=swap');
		
		body {
			font: 16px "Gowun Batang", dotum, sans-serif;
		}
		div{
			text-align: center;
		}
	</style>
</head>
<body>
	<div style="text-align: center">
		<h4>아이디 중복 확인 결과</h4>
<%
	String id = request.getParameter("id").trim();
	int cnt = memberDao.duplecateID(id);
	
	out.println("입력ID: <strong>" + id + "</strong>");
	if(cnt == 0){
		out.print("<p>사용 가능한 아이디입니다</p>");
%>
	<!-- 사용가능한 id를 부모창(opener)에 전달하기(memberForm.jsp) -->
	<a href="javascript:apply('<%=id %>')">사용하기</a>
	<script>
		function apply(id){
			//<form name="memfrm">
			//	<input type="text" name="id">
			opener.document.memfrm.id.value = id; //부모창 -> body 접근 -> memfrm 폼의 id의 value에 저장
			window.close();
		}//apply() end
	</script>
<%
	} else {
		out.println("<p style='color: red'>해당 아이디는 사용할 수 없습니다</p>");
	}//if end
%>
	<hr>
	<a href="javascript:history.back()">다시 입력</a>
	&nbsp;&nbsp;
	<a href="javascript:window.close()">취소</a>
	</div>
	
</body>
</html>