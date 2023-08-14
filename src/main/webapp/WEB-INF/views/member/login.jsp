<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOC TYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
$("#btnLogin").click(function(){
 var m_id = $("#m_id").val();
 var m_pw=$("#m_pw").val();
   if(m_id == ""){
  alert("아이디를 입력하세요");
  $("#m_id").focus();
  return;
}
if(m_pw == ""){
 alert("비밀번호를 입력하세요");
 $("#m_pw").focus();
  return;
}

 document.form1.action= "${pageContext.request.contextPath}/login.do";
 document.form1.submit();
 });
});
</script>
<%@ include file="/resources/include/header.jsp" %>
    <!-- Section-->
    <section class="py-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <form name="form1" method="post">
                <div>
                    <input class="text-50 text-center" type="text" name="m_id" placeholder="아이디" id="m_id">
                </div>
                <div>
                    <input class="form-control text-center" type="password" name="m_pw" placeholder="비밀번호" id="m_pw">
                </div>
                <div>
                    <span class="point successPwChk"></span>
                </div>
                <div>
                    <a href="${pageContext.request.contextPath}/searchId.do">아이디찾기/</a>
                </div>
                <div>
                    <a href="${pageContext.request.contextPath}/searchPw.do">비밀번호찾기/</a>
                </div>
                <div>
                    <button type="button" class="btn btn-dark" id="btnLogin">로그인 </button>
                </div>
            </form>
        </div>
    </section>
<%@ include file="/resources/include/footer.jsp" %>