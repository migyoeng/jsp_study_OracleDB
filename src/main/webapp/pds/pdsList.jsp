<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 pdsList.jsp -->
<style>
	/* 제목 링크 폰트 색 변경 */
	#pdslist_link{
		color: #424242;
	}
</style>

<h3><strong>포토 갤러리</strong></h3>

<p class="text-right">
	<a href="pdsForm.jsp" class="btn btn-default btn-custom1">사진 업로드</a>
</p>

<%
	ArrayList<PdsDTO> list = pdsDao.list();
	if(list == null){
		//자료가 없으면
		out.println("등록된 사진이 없습니다");
	} else {
		//자료가 하나라도 있으면
		out.println("<p style='text-align: left'>전체 업로드 개수: " + list.size() + "</p>");
%>
	<table class="table table-hover table-responsive">
		<thead>
			<tr>
				<th>제목</th>
				<th class="text-center">사진</th>
				<th class="text-center">조회수</th>
				<th class="text-center">작성자</th>
				<th class="text-center">작성일</th>
			</tr>
		</thead>
		<tbody>
<%
	for(int i=0; i<list.size(); i++){
		pdsDto = list.get(i);
%>
			<tr>
				<td class="text-left"><a href="pdsRead.jsp?pdsno=<%=pdsDto.getPdsno() %>" id="pdslist_link"><%=pdsDto.getSubject() %></a></td>
				<td><img src="../storage/<%=pdsDto.getFilename() %>" width="50" height="40"></td>
				<td><%=pdsDto.getReadcnt() %></td>
				<td><%=pdsDto.getWname() %></td>
				<td><%=pdsDto.getRegdate().substring(0, 10) %></td>
			</tr>
<%
		
	}//for end
%>
		</tbody>
	</table>
<%
	}//if end
%>


<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>