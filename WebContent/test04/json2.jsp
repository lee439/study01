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
			var jsonStr = '{ "age": [22,23,25]}';
			var jsonInfo = JSON.parse(jsonStr);
			var output = "회원 나이<br>";
			output += "=========<br>";
			for(var i in jsonInfo.age){
				output += jsonInfo.age[i]+"<br>";
			}
			$('#output').html(output);
			
		});
		
	});



</script>
</body>
</html>