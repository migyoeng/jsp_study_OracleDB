<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 bbsIns.jsp -->
<%
	//사용자가 입력 요청한 정보 가져오기
	String wname = request.getParameter("wname").trim();
	String subject = request.getParameter("subject").trim();
	String content = request.getParameter("content").trim();
	String passwd = request.getParameter("passwd").trim();
	String ip = request.getRemoteAddr();
	
	//bbsDto 객체에 담기
	bbsDto.setWname(wname);
	bbsDto.setSubject(subject);
	bbsDto.setContent(content);
	bbsDto.setPasswd(passwd);
	bbsDto.setIp(ip);
	
	int cnt = bbsDao.create(bbsDto);
	
	if(cnt == 0){
		out.print("글 등록을 실패했습니다");
		out.print("<p><a href='javascript:history.back()'>[다시 시도]</></p>");
	} else {
		out.print("<script>");
		out.print("alert('게시글이 등록되었습니다');");
		out.println("location.href='bbsList.jsp';");
		out.print("</script>");
	}//if end
%>



<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>