<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOC TYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
            $("#m_pw").blur();
});
</script>
<%@ include file="/resources/include/header.jsp" %>
    <!-- Section-->
    <section class="py-5">
        <form action="${pageContext.request.contextPath}/login.do" method="post">
            <input type="text" name="m_id" placeholder="아이디">
            <input type="text" name="m_pw" placeholder="비밀번호" id="m_pw">
            <span class="point successPwChk"></span>
            <a href="${pageContext.request.contextPath}/searchId.do">아이디찾기/</a>
            <input type="submit" value="로그인">
        </form>
    </section>
<%@ include file="/resources/include/footer.jsp" %>