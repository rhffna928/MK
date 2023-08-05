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


    </section>
<%@ include file="/resources/include/footer.jsp" %>