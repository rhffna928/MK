<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOC TYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    $(function(){
        $(".adminUpdateInfo").click(function(){
            var m_idx = $(this).attr("name");
            var id_input = "#m_grade"+m_idx;
            var m_grade = $(id_input).val();
                $.ajax({
                    type : "post",
                    url : "${pageContext.request.contextPath}/adminUpdateInfo.do",
                    data : {
                        "m_idx" : m_idx,
                        "m_grade" : m_grade
                    },
                    success : function(data){
                        if(data == "N"){
                            alert("회원등급 수정이 불가합니다.");
                        }else{
                            alert("회원등급 수정이 완료되었습니다.");
                            $(id_input).attr("disable", true);
                        }
                    }, error: function(error){alert("에러")}
                });
        });

        $("#adminDelInfo").click(function(){

            let m_idx_arr = new Array();

            $("input:checked").each(function(index, item){
                m_idx_arr[index] = $(item).val();
            });
            $.ajax({
                type : "post",
                url : "${pageContext.request.contextPath}/adminDeleteInfo.do",
                data : {
                    "m_idx_arr" : m_idx_arr,
                },
                success : function(data){
                    if(data == "N"){
                        alert("회원삭제 실패");
                    }else{
                        alert("회원삭제 성공");
                        $("tr:has(input:checked)").remove();
                    }
                }, error: function(error){alert("회원삭제 중에러")}
            });
        });
    });
</script>
<%@ include file="/resources/include/header.jsp" %>
    <!-- Section-->
    <section class="py-5">

        <table border="1px" style="width:1200px" >
            <thread>
            <tr>
            <th>회원번호</th>
            <th>회원이름</th>
            <th>회원이메일</th>
            <th>회원전화번호</th>
            <th>등급</th>
            <th>성별</th>
            <th>생년월일</th>
            <th>계정생성일</th>
            <th>삭제여부</th>
            </tr>
            </thread>
            <tbody>
                <c:forEach items="${memberDTO}" var="member">
                    <tr>
                        <td>${member.m_idx}</td>
                        <td>${member.m_id}</td>
                        <td>${member.m_email}</td>
                        <td>${member.m_tel}</td>
                        <td><input type="text" id="m_grade${member.m_idx}" value="${member.m_grade}" size="3"></td>
                        <td><button class="adminUpdateInfo" name="${member.m_idx}">수정</button></td>
                        <td>${member.m_gender}</td>
                        <td>${member.m_jumin}</td>
                        <td>${member.m_writeday}</td>
                        <td>${member.delyn}</td>
                        <td>삭제<input type="checkbox" value="${member.m_idx}"></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="9">
                    <button id="adminDelInfo">삭제하기</button>
                    </tb>
                </tr>
                </tbody>
        </table>
    </section>
<%@ include file="/resources/include/footer.jsp" %>