<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 blank.jsp -->
<style>
	th{
		width: 100px;
	}
</style>
<h3><strong>메일 전송하기</strong></h3>

<form method="post" action="mailProc.jsp">
	<table class="table">
		<tr>
		    <th>받는사람</th>
			<td><input type="email" name="to" class="form-control" placeholder="example@web.com"></td>
		</tr>
		<tr>
		    <th>보내는사람</th>
			<td><input type="email" name="from" class="form-control" placeholder="example@web.com"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject" class="form-control" placeholder="제목을 입력해주세요"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="5" cols="30" name="content" id="summernote" id="content"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="메일보내기" class="btn btn-default btn-custom1">
				<input type="reset"  value="취소"     class="btn btn-default">
			</td>
		</tr> 
	</table>
</form>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>