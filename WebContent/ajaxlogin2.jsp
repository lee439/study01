<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Login Ajax</title>
</head>

<body>

  <h2>Login Ajax(jQuery)</h2><hr/>
  <form id="frmLogin" name="frmLogin" 
     action="ajaxloginok2.jsp" method="post">
    <input type="text" id="user_id" name="user_id" placeholder="아이디" /><br/>
    <input type="password" id="user_pw" name="user_pw" placeholder="패스워드" /><br/>
    <input type="button" id="btnLogin" value="로그인" />
  </form>

  <div id="msg"></div>
  <script src="http://code.jquery.com/jquery-1.12.0.js"></script>
  <script>
    $(document).ready(function() {
      $('#btnLogin').click(function() {
        var action = $('#frmLogin').attr("action");
        
        var obj = new Object();
        obj.type="login";
        obj.id=$("#user_id").val();
        obj.pw=$("#user_pw").val();
        
        if(obj.id == "" || obj.pw == ""){
        	alert("아이디와 비번을 입력하세요");
        	return;
        }
        
        var form_data = JSON.stringify(obj);        
        $.ajax({
                  type: "POST",
                  url: action,
                  data: form_data,                 
                  contentType : 'application/json',
                  success: function(data) {        
                    var result = JSON.parse(data);
    				console.log(data);
    				if(result.id=="test"){
    					sessionStorage.setItem("user_id", form_data.user_id);
                        $('#msg').html("<p style='color:green; font-weight:bold'> 로그인 성공!</p>");
    				}else{
    					$('#msg').html("<p>아이디 비번확인</p>");
    				}    				    
                  },
                  error: function() {
                    $('#msg').html("<h2>서버문제!</h2>");
                  }
        });
      });
    });
  </script>
</body>
</html>