<%@page import="javax.mail.Transport"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="net.utility.Utility"%>
<%@page import="javax.mail.Session"%>
<%@page import="net.utility.MyAuthenticator"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 findID.jsp -->
<%
	String mname = request.getParameter("mname").trim();
	String email = request.getParameter("email").trim();
	
	memberDto.setMname(mname);
	memberDto.setEmail(email);
	
	boolean flag = memberDao.findID(memberDto);
	
	if(flag == false){
		//조회된 레코드가 없으면
		out.print("존재하지 않는 회원입니다.<br>");
		out.print("이름과 이메일을 다시 한번 확인해주세요");
		out.print("<p><a href='javascript:history.back()'>[다시 시도]</></p>");
	} else {
		//조회된 레코드가 있으면
		String message = "";
		message += "해당 메일로 ID와 임시 비밀번호를 전송했습니다<br>";
		message += "메일 확인 후 다시 로그인 해주세요<br>";
		message += "임시비밀번호는 로그인 후 회원 정보에서 수정하실 수 있습니다.";
		out.print(message);
%>
		<hr>
		<a href="loginForm.jsp" class="btn btn-default btn-custom1">로그인하기</a>
<%
		
	}//if end
%>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>