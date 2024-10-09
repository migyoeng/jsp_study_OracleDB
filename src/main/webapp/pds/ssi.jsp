<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- ssi.jsp 공통 페이지 --%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page import="net.utility.*" %>
<%@ page import="net.pds.*" %>

<%-- 객체 생성 --%>
<%-- PdsDAO pdsDao = new PdsDAO() --%>
<jsp:useBean id="pdsDto" class="net.pds.PdsDTO" scope="page"></jsp:useBean>
<jsp:useBean id="pdsDao" class="net.pds.PdsDAO" scope="page"></jsp:useBean>

<% request.setCharacterEncoding("UTF-8");%>
