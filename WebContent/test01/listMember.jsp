<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="sec04.ex01.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body align="center">
	<h2>회원정보</h2>
	
	<table align="center">
		<tr align="center" bgcolor="lightgreen">
			<td><b>아이디</b></td>
			<td><b>비밀번호</b></td>
			<td><b>이름</b></td>
			<td><b>이메일</b></td>
			<td><b>가입일</b></td>	
		</tr>
		
		<c:choose>
			<c:when test="${memberList==null }">
			<tr>
				<td><b>등록된 회원이 없습니다.</b></td>
			</tr>
			</c:when>
			<c:when test="${memberList!=null }">
			<c:forEach var="mem" items="${memberList }">
				<tr align="center">
					<td>${mem.id }</td>
					<td>${mem.pwd }</td>
					<td>${mem.name }</td>
					<td>${mem.email }</td>
					<td>${mem.joinDate }</td>
				</tr>
			</c:forEach>
			</c:when>
		</c:choose>

	</table>
	<a href="${contextPath}/member/delMember.do">회원가입하기</a>

</body>
</html>