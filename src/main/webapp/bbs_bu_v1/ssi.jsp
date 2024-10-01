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