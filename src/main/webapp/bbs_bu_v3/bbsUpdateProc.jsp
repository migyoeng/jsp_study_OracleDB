<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 bbsUpdateProc.jsp -->
<%
	//수정 요청한 정보 가져오기
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String wname = request.getParameter("wname");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String passwd = request.getParameter("passwd");
	String ip = request.getRemoteAddr();
	
	bbsDto.setBbsno(bbsno);
	bbsDto.setWname(wname);
	bbsDto.setSubject(subject);
	bbsDto.setContent(content);
	bbsDto.setPasswd(passwd);
	bbsDto.setIp(ip);
	
	//bbsDao.updateProc() 호출
	int cnt = bbsDao.updateProc(bbsDto);
	
	if(cnt == 0){
		out.print("비밀번호가 일치하지 않습니다. 다시 한번 확인해주세요");
		out.print("<p><a href='javascript:history.back()'>[다시 시도]</></p>");
	} else {
		out.print("<script>");
		out.print("alert('게시글이 수정되었습니다');");
		out.println("location.href='bbsList.jsp?col=" + col + "&word=" + word + "';");
		out.print("</script>");
	}//if end

%>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>