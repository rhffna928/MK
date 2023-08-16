<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOC TYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){

    $("#changeAddr").click(function(){

        let m_idx = $(this).attr("name");
        let m_addr1 = $("#m_addr1").val();
        let m_addr2 = $("#m_addr2").val();
        let m_addr3 = $("#m_addr3").val();
        $.ajax({
            type : "post",
            url : "${pageContext.request.contextPath}/changeAddr.do",
            data : {"m_idx":m_idx,
                "m_addr1":m_addr1,
                "m_addr2":m_addr2,
                "m_addr3":m_addr3
            },
            success : function(data){
                if(data=="Y"){
                }else{
                console.log("plus x");
                }
            },
            error: function(error){alert(error);}
        });
    });

});
</script>
<head>
<title>판매리스트</title>

</head>
<body>
<%@ include file="/resources/include/header.jsp" %>

    <!-- Section-->
<section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-2 gx-lg-2 row-cols-2 row-cols-md-2 row-cols-xl-2 justify-content-center">
                    <div>
                         <form name="frm">
                            <table border="1" class="table table-light" >
                                <input type="hidden" name="m_idx" value="${member.m_idx}">
                                <tr>
                                    <th class="table table-light">이메일</th>
                                        <td>
                                            <input type="text" name="m_email" value="${m_modi.m_email}">
                            		    </td>
                            		    <td>
                            		        <input type="button" class="btn btn-light" id="changeId" value="이메일 변경"/>
                            		    </td>
                            		</th>
                                </tr>
                                <tr>
                                    <th class="table table-light">아이디</th>
                                        <td>
                                            <input type="text" name="m_id" value="${m_modi.m_id}">
                                        </td>
                                        <td>
                                            <input type="button" class="btn btn-light" id="changeId" value="아이디 변경"/>
                                        </td>
                                    </th>
                                </tr>
                                <tr>
                                    <th class="table table-light">비밀번호</th>
                                        <td>
                                            <input type="text" name="m_pw" value="">
                                        </td>
                                        <td>
                                            <input type="button" class="btn btn-light" id="changeId" value="비밀번호 변경"/>
                                        </td>
                                    </th>
                                </tr>
                                <tr>
                                    <th class="table table-light">전화번호</th>
                                        <td>
                                            <input type="text" name="m_tel" value="${m_modi.m_tel}">
                                        </td>
                                        <td>
                                            <input type="button" class="btn btn-light" id="changeId" value="전화번호 변경"/>
                                        </td>
                                    </th>
                                </tr>
                                <tr>
                                    <th class="table table-light">주소</th>
                                        <td>
                                            <input type="text" name="m_addr1" id="m_addr1" value="${m_modi.m_addr1}"><button></button>
                                            <input type="text" name="m_addr2" id="m_addr2" value="${m_modi.m_addr2}">
                                            <input type="text" name="m_addr3" id="m_addr3" value="${m_modi.m_addr3}">
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-light" id="changeAddr" name="${member.m_idx}">주소변경</button>
                                        </td>
                                    </th>
                                </tr>
                            </table>
                         </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@ include file="/resources/include/footer.jsp" %>
</body>
</html>