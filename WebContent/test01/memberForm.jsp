<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창</title>
</head>
<body>
	<form method="post" action="${contextPath}/member/addMember.do">
		<h1>회원 가입창</h1>
		아이디 <input type="text" name="id"> <br>
		비밀번호 <input type="text" name="pwd"><br>
		이름 <input type="text" name="name"><br>
		이메일 <input type="text" name="email"><br>
		<input type="submit" value="가입하기">
		<input type="reset" value="다시적기">
	</form>
</body>
</html>