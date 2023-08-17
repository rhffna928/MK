<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOC TYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(document).ready(function(){

    $("#changeId").click(function(){

        let m_idx = $(this).attr("name");
        let m_id = $("#m_id").val();
        $.ajax({
            type : "post",
            url : "${pageContext.request.contextPath}/changeId.do",
            data : {"m_idx":m_idx,
                "m_id":m_id
            },
            success : function(data){
                if(data=="Y"){
                    alert("변경되었습니다.");
                }else{
                    alert("이미 있는 아이디입니다.");
                }
            },
            error: function(error){alert(error);}
        });
    });
    $("#changeTel").click(function(){

        let m_idx = $(this).attr("name");
        let m_tel = $("#m_tel").val();
        $.ajax({
            type : "post",
            url : "${pageContext.request.contextPath}/changeTel.do",
            data : {"m_idx":m_idx,
                "m_tel":m_tel
            },
            success : function(data){
                if(data=="Y"){
                    alert("변경되었습니다.");
                }else{
                }
            },
            error: function(error){alert(error);}
        });
    });
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
                    alert("변경되었습니다.");
                }else{

                }
            },
            error: function(error){alert(error);}
        });
    });

});

function addr_btn(){

    new daum.Postcode({
        oncomplete: function(data) {
   // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                   // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                   var addr = ''; // 주소 변수
                   var extraAddr = ''; // 참고항목 변수

                   //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                   if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                       addr = data.roadAddress;
                   } else { // 사용자가 지번 주소를 선택했을 경우(J)
                       addr = data.jibunAddress;
                   }

                   // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                   if(data.userSelectedType === 'R'){
                       // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                       // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                       if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                           extraAddr += data.bname;
                       }
                       // 건물명이 있고, 공동주택일 경우 추가한다.
                       if(data.buildingName !== '' && data.apartment === 'Y'){
                           extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                       }
                       // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                       if(extraAddr !== ''){
                           extraAddr = ' (' + extraAddr + ')';
                       }
                       // 주소변수 문자열과 참고항목 문자열 합치기
                       addr += extraAddr;

                   } else {
                       addr += ' ';
                   }

                   // 우편번호와 주소 정보를 해당 필드에 넣는다.
                   $("#m_addr1").val(data.zonecode);
                   $("#m_addr2").val(addr);
                   // 커서를 상세주소 필드로 이동한다.
                   $("#m_addr3").focus();
    }
        }).open();

}

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
                            		        <input type="button" class="btn btn-light" id="changeEmail" name="${member.m_idx}" value="이메일 변경"/>
                            		    </td>
                            		</th>
                                </tr>
                                <tr>
                                    <th class="table table-light">아이디</th>
                                        <td>
                                            <input type="text" name="m_id" id="m_id" value="${m_modi.m_id}">
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-light" id="changeId" name="${member.m_idx}" >아이디변경</button>
                                        </td>
                                    </th>
                                </tr>
                                <tr>
                                    <th class="table table-light">비밀번호</th>
                                        <td>
                                            <input type="text" name="m_pw" value="">
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-light" id="changePw" name="${member.m_idx}" >비밀번호변경</button>
                                        </td>
                                    </th>
                                </tr>
                                <tr>
                                    <th class="table table-light">전화번호</th>
                                        <td>
                                            <input type="text" name="m_tel" id="m_tel" value="${m_modi.m_tel}">
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-light" id="changeTel" name="${member.m_idx}">전화번호변경</button>
                                        </td>
                                    </th>
                                </tr>
                                <tr>
                                    <th class="table table-light">주소</th>
                                        <td>
                                            <div>
                                                <input type="text" name="m_addr1" id="m_addr1" value="${m_modi.m_addr1}">
                                                <button type="button" class="btn btn-light" onclick="addr_btn()">주소검색</button>
                                            </div>
                                            <input type="text" name="m_addr2" id="m_addr2" value="${m_modi.m_addr2}">
                                            <input type="text" name="m_addr3" id="m_addr3" value="${m_modi.m_addr3}" placeholder="상세주소 입력">
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