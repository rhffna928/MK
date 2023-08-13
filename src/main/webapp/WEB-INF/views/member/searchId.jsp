<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOC TYPE html>
<html>

<meta charset="UTF-8">
<head>
    <title>아이디찾기</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
     $(document).ready(function(){

         	$("#id_find").click(function(){
         		let m_email = $("#m_email").val();
         		alert(m_email);
         		$.ajax({
         			type : "post",
         			url : "${pageContext.request.contextPath}/searchIdProcess.do",
         			data : {"m_email":m_email
         				},
         			success : function(data){
         				if(data==null){
         					$("#search_id").html("등록되어 있지 않은 이름입니다.").css("color","red");
         				}else{
         					result="아이디는 :"+data+"입니다.";
         					$("#search_id").text(result).css("color","green");
         				}
         			},
         			error: function(error){alert(error);}
         		});
         	});
          });
     </script>
</head>
<body>
<p> Hello World!! </p>
    <button onclick="GetTime()">Time</button>
    <button onclick="alert_box()" >alert</button>
    <h1 id="time"></h1>
    <form action="${pageContext.request.contextPath}/login.do" method="post">
        <input type="text" name="m_email" placeholder="이메일" id="m_email">
        <button type="button" id="id_find">아이디찾기</button>
         <span id="search_id">gdgdgdg
            </span>
        <input type="submit" value="로그인">
    </form>
</body>
</html>