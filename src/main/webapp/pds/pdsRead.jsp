<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 pdsRead.jsp -->
<style>
	.table th{
		text-align: center;
	}
	.table img{
		max-width: 300px;
	}
</style>
<h3><strong>포토 갤러리</strong></h3>

<p class="text-right">
	<a href="pdsForm.jsp" class="btn btn-default btn-custom1">사진 업로드</a>
</p>

<%
	int pdsno = Integer.parseInt(request.getParameter("pdsno"));
	pdsDto = pdsDao.read(pdsno);
	if(pdsDto == null){
		out.println("해당 글이 존재하지 않습니다");
	} else {
		pdsDao.incrementCnt(pdsno); //조회수 증가
	}//if end
%>
	<table class="table table-responsive table-bordered">
		<tr>
			<th>제목</th>
			<td colspan="3"><%=pdsDto.getSubject() %></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%=pdsDto.getRegdate() %></td>
			<th>작성자</th>
			<td><%=pdsDto.getWname() %></td>
		</tr>
		<tr>
			<th>사진</th>
			<td colspan="3"><img src="../storage/<%=pdsDto.getFilename() %>"></td>
		</tr>
		<tr>
			<th>조회 수</th>
			<td><%=pdsDto.getReadcnt() %></td>
			<th>파일 크기</th>
			<td><%=pdsDto.getFilesize() %>byte</td>
		</tr>
	</table>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>