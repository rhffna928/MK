<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOC TYPE html>
<html>

<%@ include file="/resources/include/header.jsp" %>

    <!-- Section-->
    <section class="py-5">

        <form action="${pageContext.request.contextPath}/member/login" method="post">
            <input type="text" name="m_id" placeholder="아이디">
            <input type="text" name="m_pw" placeholder="비밀번호">
            <button onclick="">아이디찾기</button>
            <input type="submit" value="로그인">
        </form>


    </section>

<%@ include file="/resources/include/footer.jsp" %>