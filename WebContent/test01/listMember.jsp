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
  <script src="http://code.jquery.com/jquery-1.12.0.js"></script>	
	<c:choose>
		<c:when test='${msg=="addMember" }'>
			<script>
				alert("회원을 등록했습니다.");
				
			</script>
		</c:when>
		<c:when test='${msg=="modified" }'>
			<script>
				alert("회원 정보를 수정했습니다.");
				
			</script>
		</c:when>
		<c:when test='${msg=="deleted" }'>
			<script>
				alert("회원 정보를 삭제했습니다.");
			</script>
		</c:when>
	</c:choose>
	<h2>회원정보</h2>
	
	<table align="center">
		<tr align="center" bgcolor="lightgreen">
			<td><b>아이디</b></td>
			<td><b>비밀번호</b></td>
			<td><b>이름</b></td>
			<td><b>이메일</b></td>
			<td><b>가입일</b></td>
			<td><b>수정</b></td>	
			<td><b>삭제</b></td>	
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
					<td><a href="${contextPath }/member/modMemberForm.do?id=${mem.id }">수정</a></td>
					<td><a href="${contextPath }/member/delMember.do?id=${mem.id }">삭제</a></td>				
				</tr>
			</c:forEach>
			</c:when>
		</c:choose>

	</table>
	<a href="${contextPath}/member/memberForm.do">회원가입하기</a>

</body>
</html>