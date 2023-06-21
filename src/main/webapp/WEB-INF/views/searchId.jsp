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


     })



     </script>
</head>
<body>
    <form action="${pageContext.request.contextPath}/member/login" method="post">
        <input type="text" name="m_email" placeholder="이메일">

        <button onclick="location='member/searchId'">아이디찾기</button>
        <input type="submit" value="로그인">
    </form>
</body>
</html>