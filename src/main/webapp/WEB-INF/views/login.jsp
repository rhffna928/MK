<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOC TYPE html>
<html>

<meta charset="UTF-8">
<head>
    <title>로그인</title>
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <form action="${pageContext.request.contextPath}/member/login" method="post">
        <input type="text" name="m_id" placeholder="아이디">
        <input type="text" name="m_pw" placeholder="비밀번호">
        <button onclick="location='member/searchId'">아이디찾기</button>
        <input type="submit" value="로그인">
    </form>
</body>
</html>