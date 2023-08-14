<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOC TYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){

	$(".plus").on("click", function(){

		let cart_idx = $(this).attr("name");
		let cnt_plus = "#plus"+cart_idx;
		let plus = $(cnt_plus).val();

		let cnt_input = "#input"+cart_idx;
		let cnt = $("#c_cnt_input").val();
		let cntV = $(cnt_input).val();

				$(cnt_input).val(++cntV);
	});

    $(".minus").on("click", function(){

		let cart_idx = $(this).attr("name");
		let cnt_minus = "#minus"+cart_idx;
		let minus = $(cnt_minus).val();

		let cnt_input = "#input"+cart_idx;
		let cntV = $(cnt_input).val();

		let cnt = $("#c_cnt_input").val();

			if(cntV > 1){
				$(cnt_input).val(--cntV);
			}
	});
    $(".plus").on
});


</script>
<script>
$(document).ready(function(){
    var totalPrice = 0;				// 총 가격
    var totalCount = 0;				// 총 갯수
    var totalKind = 0;				// 총 종류
    var salePrice = 0;				// 총 마일리지
    var deliveryPrice = 0;			// 배송비
    var finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)
    //if("input[type='checkbox']:checked").each(function(){
    //    if($(this).val(''))
    //});
    $(".cart_info_div").each(function(index, element){

    		// 총 가격
    		totalPrice += parseInt($(element).find("#c_total_input").val());
    		// 총 갯수
    		totalCount += parseInt($(element).find("#c_cnt_input").val());
    		// 총 종류
    		totalKind += 1;
    		// 총 세일
    		salePrice += parseInt($(element).find("#c_sale_input").val());

    	});
    	if(totalPrice >= 30000){
        	deliveryPrice = 0;
        } else if(totalPrice == 0){
        	deliveryPrice = 0;
        } else {
        	deliveryPrice = 3000;
        }
        finalTotalPrice = totalPrice + deliveryPrice - salePrice;

        $(".totalPrice_span").text(totalPrice.toLocaleString());
        // 총 갯수
        $(".totalCount_span").text(totalCount);
        // 총 종류
        $(".totalKind_span").text(totalKind);
        // 총 마일리지
        $(".salePrice_span").text(salePrice.toLocaleString());
        // 배송비
        $(".delivery_price").text(deliveryPrice);
        // 최종 가격(총 가격 + 배송비)
        $(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
});
</script>
<head>
<title>판매리스트</title>

</head>
<style>
</style>
<body>
<%@ include file="/resources/include/header.jsp" %>

    <!-- Section-->
<section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-1 justify-content-center">
                    <div>
                        <table border="1px">
                            <colgroup>
                                <col width="2%">
                                <col width="30%">
                                <col width="20%">
                                <col width="20%">
                                <col width="20%">
                                <col width="8%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th></th>
                                    <th class="text-center">상품명</th>
                                    <th class="text-center">수량</th>
                                    <th class="text-center">상품가격</th>
                                    <th class="text-center">총가격</th>
                                    <th class="text-center">주문관리</th>
                                </tr>
                            </thead>
                            <c:forEach items="${cartlist}" var="c_list">
                                <div class="cart_info_div">
                                <input type="hidden" id="c_cnt_input" value="${c_list.c_cnt}">
                                <input type="hidden" id="c_p_sale_input" value="${c_list.p_sale}">
                                <input type="hidden" id="c_p_price_input" value="${c_list.p_price}">
                                <input type="hidden" id="c_total_input" value="${c_list.p_price*c_list.c_cnt}">
                                <input type="hidden" id="c_sale_input" value="${(c_list.p_price*c_list.p_sale/100)*c_list.c_cnt}">
                                </div>
                                <colgroup>
                                    <col width="2%">
                                    <col width="30%">
                                    <col width="20%">
                                    <col width="20%">
                                    <col width="20%">
                                    <col width="8%">
                                </colgroup>
                            <tbody>
                                <tr>
                                    <td class="text-center">
                                        <input class="form-check-input" type="checkbox" id="chkbox${c_list.c_idx}" value="${c_list.c_idx}" onclick="" checked>
                                    </td>
                                    <td class="text-center">
                                        <span class="text-center">
                                            ${c_list.p_name}
                                        </span>
                                        <span class="img-fluid">
                                            <img class="card navbar-toggler-icon " src="\resources\images${c_list.p_img1}" alt="..." />
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <input class="btn btn-outline-dark plus" name="${c_list.c_idx}" type="button" value="+" id="plus${c_list.c_idx}">
                                        <input class="NumberCounter__input text-center" type="text" id="input${c_list.c_idx}" name="c_cnt" value="${c_list.c_cnt}" style="width:20%;border: 0 none;"></a>
                                        <input class="btn btn-outline-dark minus" name="${c_list.c_idx}" type="button" value="-" id="minus${c_list.c_idx}">
                                    </td>
                                    <td class="text-center">
                                        <div>
                                        <c:if test="${p_list.p_sale != 0}">
                                            <span class="text-muted text-decoration-line-through text-center"><fmt:formatNumber value="${c_list.p_price}" pattern="#,###" />원</span>
                                        </c:if>
                                        </div>
                                        <span><fmt:formatNumber value="${c_list.p_price*(100-c_list.p_sale)/100}" pattern="#,###" />원</span>
                                    </td>
                                    <td class="text-center">
                                        <span><fmt:formatNumber value="${c_list.p_price*(100-c_list.p_sale)/100 *c_list.c_cnt}" pattern="#,###" />원</span>
                                    </td>
                                    <td class="text-center">
                                        <input class="btn btn-outline-dark" type="button" value="삭제" onclick="deleteCart()">
                                    </td>
                                </tr>
                            </tbody>
                            </c:forEach>
                            <tr class="text-center">
                                <td colspan="7">
                                    <div>
                                        상품 금액 :
                                        <span class="totalPrice_span">
                                        </span>
                                        원
                                        할인 금액 :
                                        <span class="salePrice_span">
                                        </span>
                                        원
                                        배송비
                                        <span class="delivery_price">
                                        </span>
                                        원
                                        최종 결제 금액 :
                                        <span class="finalTotalPrice_span">
                                        </span>
                                        원
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7">
                                    <button id="order">결제하기</button>
                                </tb>
                            </tr>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@ include file="/resources/include/footer.jsp" %>
</body>
</html>