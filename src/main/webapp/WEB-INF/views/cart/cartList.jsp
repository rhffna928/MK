<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOC TYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){

setTotalInfo();

$(".c_checkbox").on("change", function(){

    setTotalInfo($(".cart_info_div"));
});
$(".all_check_input").on("change", function(){
    if($(".all_check_input").is(":checked") == true){
    		$(".c_checkbox").prop("checked", true);
    	} else if($(".all_check_input").is(":checked") == false){
    	$(".c_checkbox").prop("checked", false);
        }
    	setTotalInfo($(".cart_info_div"));
});
$(".c_checkbox").on("click", function(){

		let totalCheckbox=0;
		let totalChecked =0;
		$("input[type='checkbox']:checked").each(function(){
			totalChecked++;
		});
		$("input[type='checkbox']").each(function(){
			totalCheckbox++;
		});

		if($('.all_check_input').is(':checked') == true && totalCheckbox != totalChecked){
			$(".all_check_input").prop("checked",false);
		}
		else if($('.all_check_input').is(':checked') == false && (totalChecked+1)==totalCheckbox)
		{

			$(".all_check_input").prop("checked",true);

		}

		//전체 상품가격 업데이트
		setTotalInfo(".cart_info_div");
	});

	$(".plus").on("click", function(){

		let cart_idx = $(this).attr("name");
		let cnt_plus = "#plus"+cart_idx;
		let plus = $(cnt_plus).val();

		let cnt_input = "#input"+cart_idx;
		let cnt = $("#c_cnt_input").val();
		let cntV = $(cnt_input).val();

		$(cnt_input).val(++cntV);
        setTotalInfo(cnt);
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
        setTotalInfo(cnt);
	});
	$(".plus").on("click", function(){

    	let c_idx = $(this).attr("name");
    	//let c_cnt_input = $('input[id="c_cnt_input"]');
    	let m_idx_input = $('input[id="m_idx_input"]');
    	let p_idx_input = $('input[id="p_idx_input"]');
    	//let c_cnt = $(c_cnt_input).val();
    	let c_cnt = $(this).parent().find('input[name="c_cnt"]').val();
    	let m_idx = $(m_idx_input).val();
    	let p_idx = $(p_idx_input).val();
    	$.ajax({
            type : "post",
            url : "${pageContext.request.contextPath}/cartUpdate.do",
            data : {"c_idx":c_idx,
                    "c_cnt":c_cnt,
                    "m_idx":m_idx,
                    "p_idx":p_idx
            },
            success : function(data){
                if(data=="Y"){
                    setTotalInfo();
                }else{
                    console.log("plus x");
                }
            }
        });
    });
    $(".minus").on("click", function(){

    	let c_idx = $(this).attr("name");
    	//let c_cnt_input = $('input[id="c_cnt_input"]');
    	let m_idx_input = $('input[id="m_idx_input"]');
    	let p_idx_input = $('input[id="p_idx_input"]');
    	//let c_cnt = $(c_cnt_input).val();
    	let c_cnt = $(this).parent().find('input[name="c_cnt"]').val();
    	let m_idx = $(m_idx_input).val();
    	let p_idx = $(p_idx_input).val();
    	let p_price = $(this).val();
    	let sale = "#sale_input"+c_idx;
    	let sale_v = $(sale).val();

    	let c_price = (p_price*(100-sale_v)/100)*c_cnt;
        str = "<input type='hidden' id='c_price_input'"+c_idx+" value="+c_price+">"+c_price.toLocaleString();
     	$.ajax({
            type : "post",
            url : "${pageContext.request.contextPath}/cartUpdate.do",
            data : {"c_idx":c_idx,
                    "c_cnt":c_cnt,
                    "m_idx":m_idx,
                    "p_idx":p_idx
            },
            success : function(data){
                if(data=="Y"){
                    document.getElementById('item__Price'+c_idx).innerHTML = "";
                    document.getElementById('item__Price'+c_idx).innerHTML = str;
                    setTotalInfo();
                }else{
                    console.log("plus x");
                }
            }
        });
    });
    $(".deleteCart").on("click", function(){

       	let c_idx = $(this).attr("name");
       	let m_idx_input = $('input[id="m_idx_input"]');
       	let p_idx_input = $('input[id="p_idx_input"]');
       	let c_cnt = $(this).parent().find('input[name="c_cnt"]').val();
       	let m_idx = $(m_idx_input).val();
       	let p_idx = $(p_idx_input).val();
       	let item_list = "#item_list"+c_idx;
       	$.ajax({
            type : "post",
            url : "${pageContext.request.contextPath}/cartDelete.do",
            data : {"c_idx":c_idx,
                    "c_cnt":c_cnt,
                    "m_idx":m_idx,
                    "p_idx":p_idx
            },
            success : function(data){
                if(data=="Y"){
                    $(item_list).remove();
                    setTotalInfo();
                }else{
                    console.log("plus x");
                }
            }
        });
    });

    function setTotalInfo(){
        var totalPrice = 0;				// 총 가격
        var totalCount = 0;				// 총 갯수
        var totalKind = 0;				// 총 종류
        var salePrice = 0;				// 총 마일리지
        var deliveryPrice = 0;			// 배송비
        var finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)
        $(".cart_info_div").each(function(index, element){

            if($(element).find(".c_checkbox").is(":checked") === true){	//체크여부

        		// 총 가격
        		totalPrice += parseInt($(element).find("#c_total_input").val());
        		// 총 갯수
        		totalCount += parseInt($(element).find("#c_cnt_input").val());
        		// 총 종류
        		totalKind += 1;
        		// 총 세일
        		salePrice += parseInt($(element).find("#c_sale_input").val());
            }
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
    }

});
function c_idx_Array(){
    var c_idx_Arr = [];
    $("input[type='checkbox']:checked").each(function(){
		if($(this).data('checked_c_idx') != null){
			c_idx_Arr.push($(this).data('checked_c_idx'));
		}
	});
	$("#c_idx_Arr").val(c_idx_Arr);

	var fm = document.frm;
    var totalPrice = ${productPrice.totalprice}
    if(totalprice = ""){
        alert("담긴 상품이 없습니다.");
    	return;
    }
    alert("전송합니다..");
	fm.action = "${pageContext.request.contextPath}/order.do";
	fm.method = "get";
	fm.submit();
	return;
}

</script>
<script>
$(document).ready(function(){


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
    <form name="frm">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-1 justify-content-center">
                <div>
                    <div>
                        <input type="checkbox" class="form-check-input all_check_input" checked><span class="all_check_span">전체선택</span>
                    </div>
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
                            <colgroup>
                                <col width="2%">
                                <col width="30%">
                                <col width="20%">
                                <col width="20%">
                                <col width="20%">
                                <col width="8%">
                            </colgroup>
                        <tbody id="item_list${c_list.c_idx}" >
                            <tr>
                                <td class="text-center">
                                    <div class="cart_info_div">
                                        <input class="form-check-input c_checkbox" type="checkbox" id="chkbox${c_list.c_idx}" data-checked_c_idx="${c_list.c_idx}" value="${c_list.c_idx}" onclick="" checked>
                                        <input type="hidden" id="m_idx_input" value="${c_list.m_idx}">
                                        <input type="hidden" id="p_idx_input" value="${c_list.p_idx}">
                                        <input type="hidden" id="c_cnt_input" value="${c_list.c_cnt}">
                                        <input type="hidden" id="sale_input${c_list.c_idx}" value="${c_list.p_sale}">
                                        <input type="hidden" id="c_p_price_input${c_list.c_idx}" value="${c_list.p_price}">
                                        <input type="hidden" id="c_total_input" value="${c_list.p_price*c_list.c_cnt}">
                                        <input type="hidden" id="c_sale_input" value="${(c_list.p_price*c_list.p_sale/100)*c_list.c_cnt}">
                                    </div>
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
                                    <button class="btn btn-outline-dark plus" name="${c_list.c_idx}" type="button" value="${c_list.p_price}" id="plus${c_list.c_idx}">+</button>
                                    <input class="NumberCounter__input text-center" type="text" id="input${c_list.c_idx}" name="c_cnt" value="${c_list.c_cnt}" style="width:20%;border: 0 none;"></a>
                                    <button class="btn btn-outline-dark minus" name="${c_list.c_idx}" type="button" value="${c_list.p_price}" id="minus${c_list.c_idx}">-</button>
                                </td>
                                <td class="text-center">
                                    <div>
                                        <c:if test="${p_list.p_sale != 0}">
                                            <span id="item_Price${c_list_c_idx}" name="${c_list.p_price}" class="text-muted text-decoration-line-through text-center">
                                            <fmt:formatNumber value="${c_list.p_price}" pattern="#,###" />원</span>
                                        </c:if>
                                    </div>
                                    <span id="item_Price${c_list_c_idx}" name="${c_list.p_price}"><fmt:formatNumber value="${c_list.p_price*(100-c_list.p_sale)/100}" pattern="#,###" />원</span>
                                </td>
                                <td class="text-center">
                                    <em id="item__Price${c_list_c_idx}" name="${c_list.p_price}">
                                        <input type="hidden" id="c_price_input${c_list_c_idx}" value="${c_list.c_price}">
                                    <fmt:formatNumber value="${c_list.c_price}" pattern="#,###" />원</em>
                                </td>
                                <td class="text-center">
                                    <button class="btn btn-outline-dark deleteCart"  type="button" value="삭제" id="deleteCart${c_list.c_idx}" name="${c_list.c_idx}">X</button>
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
                                    <input type="hidden" id="totalprice" name="totalprice" value="${productPrice.totalprice}">
                                    <fmt:formatNumber value="${productPrice.totalprice}" pattern="#,###" />
                                    </span>
                                    원
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="7">
                                <input type="hidden" id="c_idx_Arr" name="c_idx_Arr">
                                <button type="button" id="order" class="btn btn-outline-dark" onclick="c_idx_Array();">결제하기</button>
                            </tb>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
    </form>
</section>
<%@ include file="/resources/include/footer.jsp" %>
</body>
</html>