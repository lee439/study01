<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<a id="checkJson">전송</a><br><br>
<div id="output"></div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>	
<script>
	$(function(){
		$('#checkJson').click(function(){
			var _jsonInfo = '{"name":"박지성","age":25,"gender":"남자","nickname":"날센돌이"}';
			$.ajax({
				type: "post",
				async: false,
				url:application/json,
				data: {jsonInfo: _jsonInfo},
				success: function(data,textStatus){
				},
				error: function(data,textStatus){
					alert("에러발생");
				}
			}); //end of ajax
		});	//button
	}); //function




</script>
</body>
</html>