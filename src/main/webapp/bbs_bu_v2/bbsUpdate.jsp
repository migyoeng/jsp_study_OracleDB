<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 bbsUpdate.jsp -->
<!-- 글 번호가 일치하는 행을 DB에서 불러와 수정 폼에 출력 -->
<h3><strong>게시글 수정</strong></h3>

<p class="text-right">
	<a href="bbsForm.jsp" class="btn btn-default btn-custom">글 작성하기</a>
	<a href="bbsList.jsp" class="btn btn-default">글 목록보기</a>
</p>

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	bbsDto = bbsDao.read(bbsno); //글 번호에 일치하는 행 가져와 저장
	
	if(bbsDto == null){
		out.println("해당하는 글이 없습니다.");
	} else {
%>
	<form name="bbsform" id="bbsform" method="post" action="bbsUpdateProc.jsp" class="form-group row" onsubmit="return bbsCheck()">
		<input type="hidden" name="bbsno" id="bbsno" value="<%=bbsno %>">
		<!-- 검색 결과를 유지하기 위한 값 -->
		<input type="hidden" name="col" value="<%=col%>">
		<input type="hidden" name="word" value="<%=word%>">
		
		<table class="table table-responsive">
			<tr>
				<th class="text-center active"><label for="wname">작성자</label></th>
				<td>
					<input type="text" name="wname" id="wname" maxlength="20" class="form-control"
			   			   value=<%=bbsDto.getWname() %> placeholder="이름을 입력해주세요" required>
				</td>
			</tr>
			<tr>
				<th class="text-center active"><label for="subject">제목</label></th>
				<td>
					<input type="text" name="subject" id="subject" maxlength="100" class="form-control"
						   value=<%=bbsDto.getSubject() %> placeholder="제목을 입력해주세요" required>
			   </td>
			</tr>
			<tr>
				<th class="text-center active"><label for="content">내용</label></th>
				<td>
					<textarea id="summernote" name="content" id="content" class="form-control" placeholder="내용을 입력해주세요" required>
						<%=bbsDto.getContent() %>
					</textarea>
				</td>
			</tr>
			<tr>
				<th class="text-center active"><label for="passwd">비밀번호 확인</label></th>
				<td>
					<input type="password" name="passwd" id="passwd" maxlength="10" class="form-control" placeholder="비밀번호를 입력해주세요" required>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정 완료" class="btn btn-default btn-custom">
					<input type="reset" value="재작성" class="btn btn-default">
				</td>
			</tr>
		</table>
	</form>
<%	
	}//if end
%>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>