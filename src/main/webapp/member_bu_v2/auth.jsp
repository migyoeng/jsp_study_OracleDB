<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- auth.jsp 공통 페이지 --%>
<%-- 로그인 상태 정보 확인(authorize) --%>

<%
	String s_id = "";
	String s_passwd = "";
	String s_mlevel = "";
	
	if(session.getAttribute("s_id") == null || session.getAttribute("s_passwd") == null || session.getAttribute("s_mlevel") == null){
		//로그인 실패했을 경우
		s_id = "guest";
		s_passwd = "guest";
		s_mlevel = "guest";
	} else {
		//로그인 성공했을 경우 세션 변수 가져와 저장
		s_id = (String)session.getAttribute("s_id");
		s_passwd = (String)session.getAttribute("s_passwd");
		s_mlevel = (String)session.getAttribute("s_mlevel");
	}//if end

%>
