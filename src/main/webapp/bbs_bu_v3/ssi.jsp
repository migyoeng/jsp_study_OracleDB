<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- ssi.jsp 공통 페이지 --%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="net.utility.*" %>
<%@ page import="net.bbs.*" %>

<%-- 객체 생성 --%>
<%-- BbsDAO bbsDao = new BbsDAO() --%>
<jsp:useBean id="bbsDto" class="net.bbs.BbsDTO" scope="page"></jsp:useBean>
<jsp:useBean id="bbsDao" class="net.bbs.BbsDAO" scope="page"></jsp:useBean>

<% request.setCharacterEncoding("UTF-8");%>

<%
//검색
String col = request.getParameter("col");	//검색 칼럼
String word = request.getParameter("word");	//검색어

col = Utility.checkNull(col);	//문자열 값이 null이면 빈 문자열로 치환
word = Utility.checkNull(word);

//현재 페이지 번호
int nowPage = 1;
if(request.getParameter("nowPage") != null){	//요청한 페이지가 있으면
	nowPage = Integer.parseInt(request.getParameter("nowPage")); //해당 페이지로 이동
}//if end
%>