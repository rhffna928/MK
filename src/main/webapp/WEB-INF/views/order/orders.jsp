<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOC TYPE html>
<html>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
setTotalInfo();
function setTotalInfo(){

	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let totalKind = 0;				// 총 종류
	let totalSale = 0;				// 총 마일리지
	let deliveryPrice = 0;			// 배송비
	let usePoint = 0;				// 사용 포인트(할인가격)
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)

	$(".product_price_td").each(function(index, element){
		// 총 가격
		totalPrice += parseInt($(element).find("#c_total_input").val());
		// 총 종류
		totalKind += 1;
		// 총 마일리지
		totalSale += parseInt($(element).find("#c_sale_input").val());
	});

	/* 배송비 결정 */
	if(totalPrice >= 30000){
		deliveryPrice = 0;
	} else if(totalPrice == 0){
		deliveryPrice = 0;
	} else {
		deliveryPrice = 3000;
	}

	finalTotalPrice = totalPrice + deliveryPrice - totalSale;


	/* 값 삽입 */
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 갯수
	$(".product_count").text(totalKind);
	// 총 마일리지
	$(".totalSale_span").text(totalSale.toLocaleString());
	// 배송비
	$(".delivery_price_span").text(deliveryPrice.toLocaleString());
	// 최종 가격(총 가격 + 배송비)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());

}
            var IMP = window.IMP;
			var code = "imp21307716"; //가맹점 식별코드
			IMP.init(code);

			$(".order_btn").click(function(e){
				//결제요청
				IMP.request_pay({
					//name과 amout만있어도 결제 진행가능
					pg : 'kakaopay', //pg사 선택 (kakao, kakaopay  둘다 가능 html5_inicis)
					pay_method: $("input[name='orders_payment']").val() ,
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : $("input[name='p_name_input']").val(), // 상품명
					amount : $("input[name='productPrice']").val(), //주문 가격
					buyer_name : $("input[name=m_id]").val(), //주문자
				  	buyer_phone : $("input[name=o_tel]").val(), //번호
					buyer_addr1: $("#m_addr1").val(),
				  	buyer_addr2: $("#m_addr2").val(),
				  	buyer_addr3: $("#m_addr3").val(),
					//결제완료후 이동할 페이지 kko나 kkopay는 생략 가능
					m_redirect_url : '${pageContext.request.contextPath}/index.do'
				}, function(rsp){
					if(rsp.success){//결제 성공시
						var msg = '결제가 완료되었습니다';
						var result = {
						"imp_uid" : rsp.imp_uid,
						"merchant_uid" : rsp.merchant_uid,
						"pay_date" : new Date().getTime(),
						"amount" : rsp.paid_amount,
						"card_no" : rsp.apply_num,
						"refund" : 'payed'
						}
						orderInsert();
						console.log("결제성공 " + msg);
					}
					else{//결제 실패시
						var msg = '결제에 실패했습니다';
						msg += '에러 : ' + rsp.error_msg
					}
					console.log(msg);
				});//pay
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
function showAddress(className){
    $(".addressInfo_input_div").css('display', 'none');
	$(".addressInfo_input_div_" + className).css('display', 'block');
	$(".address_btn").css('backgroundColor', '#555');
    $(".address_btn"+className).css('backgroundColor', '#3c3838');
    $(".addressInfo_input_div").each(function(i, obj){
    	$(obj).find(".selectAddress").val("F");
    });
    /* 선택한 selectAdress T만들기 */
    $(".addressInfo_input_div_" + className).find(".selectAddress").val("T");
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
.total_info_div{
	position:absolute;
	top: 550px;
	right : 0;
	width : 300px;
	border : 1px solid #333;
	border-top-width:2px;

}
.total_info_price_div{
	width: 90%;
    margin: auto;
	position: relative;
}
.total_info_div ul{
	list-style: none;
}
.total_info_div li{
	text-align: right;
	margin-top:10px;
}
.price_span_label{
	float: left;
}
.price_total_li{
	border-top: 1px solid #ddd;
	padding-top: 20px;
}
.strong_red{
	color: red;
}
.total_price_red{
	font-size: 25px;
}
.total_price_label{
	margin-top: 5px;
}
.point_li{
    padding: 15px;
    border-top: 1px solid #ddd;
    margin: 10px -15px 0;
}
.total_info_btn_div{
	border-top: 1px solid #ddd;
    text-align: center;
    padding: 15px 20px;
}
.order_btn{
    display: inline-block;
    font-size: 21px;
    line-height: 50px;
    width: 200px;
    height: 50px;
    background-color: #365fdd;
    color: #fff;
    font-weight: bold;
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
                        주문상품 <span class="product_count"></span> 개
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
                                    <td class="product_price_td">
                                        ${p_List.p_name}
                                        <input type="hidden" class="m_idx" id="m_idx" value="${member.m_idx}">
                                        <input type="hidden" id="m_idx_input" value="${p_List.m_idx}">
                                        <input type="hidden" id="p_idx_input" value="${p_List.p_idx}">
                                        <input type="hidden" id="c_cnt_input" value="${p_List.c_cnt}">
                                        <input type="hidden" id="p_sale_input" value="${p_List.p_sale}">
                                        <input type="hidden" name="p_name_input" id="p_name_input" value="${p_List.p_name}">
                                        <input type="hidden" id="c_p_price_input${p_List.c_idx}" value="${p_List.p_price}">
                                        <input type="hidden" id="c_total_input" value="${p_List.p_price*p_List.c_cnt}">
                                        <input type="hidden" name="finalprice" id="finalprice" value="${p_List.p_price*(100-p_List.p_sale)/100*p_List.c_cnt}">
                                        <input type="hidden" id="c_sale_input" value="${(p_List.p_price*p_List.p_sale/100)*p_List.c_cnt}">

                                    </td>
                                    <td>
                                        <fmt:formatNumber value="${p_List.p_price*(100-p_List.p_sale)/100*p_List.c_cnt}" pattern="#,###" />원
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!--포인트정보-->
                <!--주문종합 정보-->
            	<div class="total_info_div">
            		<!-- 가격 종합 정보 -->
            		<div class="total_info_price_div">
            			<ul>
            				<li>
            					<span class="price_span_label">상품 금액</span>
            					<span class="totalPrice_span"></span>원
            				</li>
            				<li>
            					<span class="price_span_label">배송비</span>
            					<span class="delivery_price_span"></span>원
            				</li>
            																		<li>
            					<span class="price_span_label">할인금액</span>
            					<span class="totalSale_span"></span>원
            				</li>
            				<li class="price_total_li">
            					<strong class="price_span_label total_price_label">최종 결제 금액</strong>
            					<input type="hidden" name="productPrice" id="productPrice" value="${productPrice.totalprice}">
            					<strong class="strong_red">
            						<span class="total_price_red finalTotalPrice_span">

            						</span>원
            					</strong>
            				</li>
            			</ul>
            		</div>
            		<!-- 버튼 영역 -->
            		<div class="total_info_btn_div">
            			<a class="btn btn-outline-dark order_btn">결제하기</a>
            		</div>
            		<!-- 주문 요청 -->
            		<form class="order_form" action="/order" method="post">
            			<!-- 주문자 회원번호 -->
            			<input name="m_idx" value="${member.m_idx}" type="hidden">
            			<!-- 주소록 & 받는이-->
            			<input name="o_rec" type="hidden">
            			<input name="m_addr1" type="hidden">
            			<input name="m_addr2" type="hidden">
            			<input name="m_addr3" type="hidden">
            			<!-- 상품 정보 -->
            		</form>
            	</div>
            </div>
        </div>
    </div>
</section>
<%@ include file="/resources/include/footer.jsp" %>
</body>
</html>