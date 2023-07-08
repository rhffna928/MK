<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOC TYPE html>
<html>

<meta charset="UTF-8">
<head>
    <title>비밀번호찾기</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
     $(document).ready(function(){
         	$("#pw_find").click(function(){
         		let m_id = $("#m_id").val();
         		let m_tel = $("#m_tel").val();
         		alert(m_id + m_tel);
         		$.ajax({
         			type : "post",
         			url : "${pageContext.request.contextPath}/searchPwProcess.do",
         			data : {"m_id":m_id,
         			        "m_tel":m_tel
         				},
         			success : function(data){
         				if(data==""){
         				    result="등록되어 있지 않은 아이디 및 핸드폰 번호입니다.";
         					$("#search_pw").text(result).css("color","red");
         				}else{
         					result="비밀번호는 :"+data+"입니다.";
         					$("#search_pw").text(result).css("color","green");
         				}
         			},
         			error: function(error){alert(error);}
         		});
         	});
          });vcn
     </script>
</head>
<body>

    <%@ include file="/resources/include/header.jsp" %>
    <section>

    <form action="${pageContext.request.contextPath}/login.do" method="post">
        <input type="text" name="m_id" placeholder="아이디" id="m_id">
        <input type="text" name="m_tel" placeholder="핸드폰번호" id="m_tel">
        <button type="button" id="pw_find">비밀번호 찾기</button>
         <span id="search_pw">
            </span>
        <a href="${pageContext.request.contextPath}/login.do">로그인</a>
    </form>
    </section>
</body>
    <%@ include file="/resources/include/footer.jsp" %>
</html>