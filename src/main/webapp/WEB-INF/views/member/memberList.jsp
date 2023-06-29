<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOC TYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


</script>
<%@ include file="/resources/include/header.jsp" %>
    <!-- Section-->
    <section class="py-5">
    <c:forEach var="MemberDTO" items="${m_list}">
        <table border="1" style="width:800px">
            <td>회원번호</td>
            <td>회원이름</td>
            <td>회원이메일</td>
            <td>회원전화번호</td>
            <td>등급</td>
            <td>성별</td>
            <td>생년월일</td>
            <td>계정생성일</td>
            <td>삭제여부</td>
            <tr>${m_list.m_idx}</tr>
            <tr>${m_list.m_id}</tr>
            <tr>${m_list.m_email}</tr>
            <tr>${m_list.m_tel}</tr>
            <tr>${m_list.m_grade}</tr>
            <tr>${m_list.m_gender}</tr>
            <tr>${m_list.m_jumin}</tr>
            <tr>${m_list.m_writeday}</tr>
            <tr>${m_list.m_delyn}</tr>
            <tr></tr>
            <tr></tr>
            <tr></tr>

    </section>
<%@ include file="/resources/include/footer.jsp" %>