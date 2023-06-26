<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    $(function(){
        $(document).ready(function(){
            $("#m_pw").blur(function(){
                $("#successPwChk2").text('');
            });
            $("#m_pw2").blur(function(){
                if($("#m_pw").val() != $("#m_pw2").val()){
                result = "비밀번호가 일치하지 않습니다.";
                $(".successPwChk2").html(result).css("color","red");
                $('#m_pw').val("").trigger("focus");
                $(".pwChk").val(false);
                }else{
                    result = "비밀번호가 일치합니다.";
                    $(".successPwChk2").html(result).css("color","green");
                    $(".PwChk").val(true);
                }return;
            });
        });
    });
</script>
    <%@ include file="/resources/include/header.jsp" %>

        <!-- Section-->
        <section class="py-5">

            <form action="/save.do" method="post">
                <input type="text" name="m_email" placeholder="이메일">
                <input type="text" name="m_id" placeholder="아이디">
                <input type="text" name="m_pw" placeholder="비밀번호" id="m_pw">
                <span class="point successPwChk"></span>
                <input type="text" name="m_pw2" placeholder="비밀번호확인" id="m_pw">
                <span class="point successPwChk2"></span>
                <input type="hidden" id="PwChk">
                <input type="text" name="m_tel" placeholder="나이">
                <input type="text" name="m_jumin" placeholder="전화번호">
                <input type="checkbox" name="m_gender" value="남">남
                <input type="checkbox" name="m_gender" value="여">여
                <input type="submit" value="회원가입">
            </form>

        </section>

    <%@ include file="/resources/include/footer.jsp" %>