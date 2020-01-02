<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<input type="button" value="출력" id="checkJson">
<div id="output"></div>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>	
<script>
	$(function(){
		$('#checkJson').click(function(){
			var jsonStr = '{"members":[{"name":"박지성","age":25,"gender":"남자","nickname":"날센돌이"}'+',{"name":"손흥민","age":25,"gender":"남자","nickname":"쏘니"}]}';
			var jsonObj = JSON.parse(jsonStr);
			var output = "회원 정보<br>";
			output += "=========<br>";
			for(var i in jsonObj.members){
			output += "이름:"+jsonObj.members[i].name+"<br>";
			output += "나이:"+jsonObj.members[i].age+"<br>";
			output += "성별:"+jsonObj.members[i].gender+"<br>";
			output += "닉네임:"+jsonObj.members[i].nickname+"<br>";
			}
		$('#output').html(output);
		
		});	
	});




</script>
</body>
</html>