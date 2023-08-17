<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOC TYPE html>
<html>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
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
function showAddress(className){
    $(".addressInfo_input_div").css('display', 'none');
	$(".addressInfo_input_div_" + className).css('display', 'block');
	$(".address_btn").css('backgroundColor', '#555');
    $(".address_btn"+className).css('backgroundColor', '#3c3838');
}
</script>
<head>
<title>판매리스트</title>

</head>
<style>
.address_btn {
    background-color: #555;
    color: white;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    font-size: 17px;
    width: 50%;
}
.address_btn:hover{
	background-color: #111;
}
.addressInfo_btn_div::after{
	content:'';
	display:block;
	clear:both;
}
.addressInfo_input_div{
			padding:12px;
			text-align: left;
			display: none;
			line-height: 40px;
		}
		.addressInfo_input_div th{
			border-color: transparent;
		    background-color: transparent;
		}
		.addressInfo_input_div th{
			padding : 12px 5px 12px 20px;
			vertical-align: top;
		}
		.addressInfo_input_div td{
			padding : 8px 12px;
		}
		.addressInfo_input_div_2 input{
			padding: 6px 5px;
		}
</style>
<body>
<%@ include file="/resources/include/header.jsp" %>

    <!-- Section-->
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-1 justify-content-center">
            <div>
                <!--회원정보-->
                <div>
                    <table class="table">
                        <tbody>
                            <tr>
                                <th style="width=25%;">주문자</th>
                                <td style="width=75%;">${member.m_email} | ${member.m_id}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!--배송지정보-->
                <div class="address_Info">
                    <div class="addressInfo_btn_div">
                        <button class="btn btn-dark btn:hover address_btn address_btn1" onclick="showAddress('1')" style="background-color: #3c3838;">사용자 정보</button>
                        <button class="btn btn-dark btn:hover address_btn address_btn2" onclick="showAddress('2')">직접 입력</button>
                    </div>
                    <div class="address_input_wrap">
                        <div class="addressInfo_input_div addressInfo_input_div_1" style="display:block">
                            <table class="table">
                                <colgroup>
                                    <col width="25%">
                                    <col width="*">
                                </colgroup>
                            <tbody>
                                <tr>
                                    <th>이름</th>
                                    <td>
                                        ${member.m_id}
                                    </td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                        <td>
                                        ${member.m_addr1} ${member.m_addr2}<br>${member.m_addr3}
                                        <input class="selectAddress" value="T" type="hidden">
                                        <input class="address_input" value="${member.m_id}" type="hidden">
                                        <input class="address1_input" value="${member.m_addr1}" type="hidden">
                                        <input class="address2_input" value="${member.m_addr2}" type="hidden">
                                        <input class="address3_input" value="${member.m_addr3}" type="hidden">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="addressInfo_input_div addressInfo_input_div_2">
                        <table class="table">
                            <colgroup>
                                <col width="25%">
                                <col width="*">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>이름</th>
                                    <td>
                                        <input class="input" type="text" >
                                    </td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td>
                                        <input type="text" name="m_addr1" id="m_addr1" readonly>
                                        <button type="button" class="btn btn-light" onclick="addr_btn()">주소검색</button><br>
                                        <input type="text" name="m_addr2" id="m_addr2" readonly><br>
                                        <input type="text" name="m_addr3" id="m_addr3" placeholder="상세주소 입력란">
                                        <input class="selectAddress" value="F" type="hidden">
                                        <input class="address_input" value="${member.m_id}" type="hidden">
                                        <input class="address1_input" value="${member.m_addr1}" type="hidden">
                                        <input class="address2_input" value="${member.m_addr2}" type="hidden">
                                        <input class="address3_input" value="${member.m_addr3}" type="hidden">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--상품정보-->
                <div>
                    <!--상품 총 수량-->
                    <div class="">
                        주문상품<span class=""></span>개
                    </div>
                    <!--상품테이블-->
                    <table class="table">
                        <colgroup>
                            <col width="15%">
                            <col width="45%">
                            <col width="40%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>상품 이미지</th>
                                <th>상품 정보</th>
                                <th>상품 가격</th>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table">
                        <colgroup>
                            <col width="15%">
                            <col width="45%">
                            <col width="40%">
                        </colgroup>
                        <tbody>
                            <c:forEach items="${productList}" var="p_List">
                                <tr>
                                    <td>
                                        <!--이미지-->
                                        <img class="card navbar-toggler-icon " src="\resources\images${p_List.p_img1}" alt="..." />
                                    </td>
                                    <td>
                                        ${p_List.p_name}
                                        <input type="hidden" class="m_idx" id="m_idx" value="${member.m_idx}">
                                        <input type="hidden" class="" id="" value="">
                                        <input type="hidden" class="" id="" value="">
                                        <input type="hidden" class="" id="" value="">
                                        <input type="hidden" class="" id="" value="">
                                    </td>
                                    <td>
                                        ${p_List.totalprice}
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!--포인트정보-->
                <!--주문종합 정보-->
            </div>
        </div>
    </div>
</section>
<%@ include file="/resources/include/footer.jsp" %>
</body>
</html>