<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>idCheckForm</title>
	<style>
		div{
			text-align: center;
		}
	</style>
</head>
<body>
	<div>
		<h4>아이디 중복 확인</h4>
		<form action="#">
			아이디:
			<input type="text" name="id" id="id" maxlength="10" autofocus>
			<input type="submit" value="중복 확인">
		</form>
	</div>
</body>
</html>