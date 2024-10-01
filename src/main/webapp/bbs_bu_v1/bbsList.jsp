<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 bbsList.jsp -->
<h3><strong>글 목록</strong></h3>
<p class="text-right"><a href="bbsForm.jsp" class="btn btn-default btn-custom">글 작성하기</a></p>

<table class="table table-hover">
	<thead>
		<tr>
			<th class="text-left active">제목</th>
			<th class="text-center active">조회수</th>
			<th class="text-center active">작성자</th>
			<th class="text-center active">작성일</th>
		</tr>
	</thead>
	<tbody>
<%
	ArrayList<BbsDTO> list = bbsDao.list(); //BbsDTO 타입을 담은 list 반환
	if(list == null){
		out.println("<tr>");
		out.println("<td colspan='4'>");
		out.println("<strong>조회할 글이 없습니다</strong>");
		out.println("</td>");
		out.println("</tr>");
	} else {
		
		//오늘 날짜를 문자열 "2024-09-26" 만들기
		String today = Utility.getDate();
		
		for(int i=0; i<list.size(); i++){
			bbsDto = list.get(i); //한 줄씩 가져와서 bbsDto 변수에 담기
%>
		<tr>
			<td style="text-align: left">
<%
				//답글 이미지
				for(int n = 1; n <= bbsDto.getIndent(); n++){
					out.println("<img src='../images/reply1.png'>");
				}//for end
%>
				<strong>
					<a href="bbsRead.jsp?bbsno=<%=bbsDto.getBbsno() %>" id="bbslist_link">
						<%=bbsDto.getSubject() %>
					</a>
				</strong>
				
<%
				//오늘 작성한 글 제목 옆 new 이미지 출력
				//작성일(regdt)에서 "년월일" 자르기
				String regdt = bbsDto.getRegdt().substring(0, 10);
				if(regdt.equals(today)){
					out.println("<img src='../images/new4.png'>");
				}//if end
				
				//조회 수가 10 이상이면 'hot' 이미지 출력
				if(bbsDto.getReadcnt() >= 10){
					out.println("<img src='../images/hot.gif'");
				}//if end
				
%>
				
			</td>
			<td><%=bbsDto.getReadcnt() %></td>
			<td><%=bbsDto.getWname() %></td>
			<td><%=bbsDto.getRegdt().substring(0,10) %></td>
		</tr>
<%
		}//for end
		
		//글 개수
		int totalRecord = bbsDao.count();
		out.println("<tr>");
		out.println("<td colspan='4' style='text-align: center;'>");
		out.println("글 개수: <strong>" + totalRecord + "</strong>");
		out.println("</td>");
		out.println("</tr>");
	}//if end
%>
	</tbody>
</table>


<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>