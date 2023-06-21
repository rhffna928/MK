<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>save</title>
  </head>
<body>
    <form action="/member/save" method="post">
        <input type="text" name="m_email" placeholder="이메일">
        <input type="text" name="m_id" placeholder="비밀번호">
        <input type="text" name="m_pw" placeholder="이름">
        <input type="text" name="m_tel" placeholder="나이">
        <input type="text" name="m_jumin" placeholder="전화번호">
        <input type="text" name="m_gender" placeholder="전화번호">
        <input type="submit" value="회원가입">
    </form>
</body>
<html>