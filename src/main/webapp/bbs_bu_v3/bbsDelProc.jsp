<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 bbsDelProc.jsp -->
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String passwd = request.getParameter("passwd").trim();
	
	bbsDto.setBbsno(bbsno);
	bbsDto.setPasswd(passwd);
	
	int cnt = bbsDao.delete(bbsDto);
	
	if(cnt == 0){
		out.print("비밀번호가 일치하지 않습니다");
		out.print("<p><a href='javascript:history.back()'>[다시 시도]</></p>");
	} else {
		out.println("<script>");
		out.println("alert('게시글이 삭제되었습니다');");
		out.println("location.href='bbsList.jsp';");
		out.println("</script>");
	}//if end

%>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>