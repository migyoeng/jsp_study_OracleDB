<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 bbsRead.jsp -->
<p class="text-right">
	<a href="bbsForm.jsp" class="btn btn-default btn-custom">글 작성하기</a>
	<a href="bbsList.jsp" class="btn btn-default">글 목록보기</a>
</p>

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));

	bbsDto = bbsDao.read(bbsno);
	if(bbsDto == null){
		out.println("해당하는 글이 없습니다");
	} else {
		bbsDao.incrementCnt(bbsno); //조회 수 증가
%>
	<table class="table table-bordered">
	<tr>
		<th>제목</th>
		<td class="active"><%=bbsDto.getSubject() %></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><%=bbsDto.getWname() %></td>
	</tr>
	<tr>
		<th>내용</th>
		<td class="active"><%=bbsDto.getContent() %></td>
		<!-- Editor 사용 안할 경우 -->
<%-- <%
		//특수문자 및 엔터를 <br> 태그로 치환하기
		String content = bbsDto.getContent();
		content = Utility.convertChar(content);
		out.print(content);
%> --%>
	</tr>
	<tr>
		<th>조회수</th>
		<td><%=bbsDto.getReadcnt() %></td>
	</tr>
	<tr>
		<th>작성일</th>
		<td><%=bbsDto.getRegdt() %></td>
	</tr>
	<tr>
		<th>IP</th>
		<td><%=bbsDto.getIp() %></td>
	</tr>
	</table>
	
	<br>
	<input type="button" value="답글 달기" class="btn btn-default btn-custom" onclick="location.href='bbsReply.jsp?bbsno=<%=bbsno %>'">
	<input type="button" value="글 수정" class="btn btn-default" onclick="location.href='bbsUpdate.jsp?bbsno=<%=bbsno%>'">
	<input type="button" value="글 삭제" class="btn btn-default" onclick="location.href='bbsDel.jsp?bbsno=<%=bbsno%>'">
<%
	}//if end
%>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>