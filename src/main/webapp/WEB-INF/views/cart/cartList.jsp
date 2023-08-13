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
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-2 justify-content-center">
                    <div>
                        <table>
                            <colgroup>
                                <col width="30%">
                                <col width="30%">
                                <col width="20%">
                                <col width="20%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>상품명</th>
                                    <th>수량</th>
                                    <th>상품가격</th>
                                    <th>총가격</th>
                                </tr>
                            </thead>
                            <c:forEach items="${cartlist}" var="c_list">
                                <input type="hidden" id="c_cnt_input" value="${c_list.c_cnt}">
                             <colgroup>
                                <col width="30%">
                                <col width="30%">
                                <col width="20%">
                                <col width="20%">
                             </colgroup>
                            <tbody>
                                <tr>
                                    <td>
                                        ${c_list.p_name}
                                        <img class="card-img-bottom" src="\resources\images${c_list.p_img1}" alt="..." />
                                    </td>
                                    <td>
                                        <input class="plus" name="${c_list.c_idx}" type="button" value="+" id="plus${c_list.c_idx}">
                                        <input  class="input" type="text" id="input${c_list.c_idx}" name="c_cnt" value="${c_list.c_cnt}"></a>
                                        <input class="minus" name="${c_list.c_idx}" type="button" value="-" id="minus${c_list.c_idx}">
                                    </td>
                                    <td>
                                        <c:if test="${p_list.p_sale != 0}">
                                            <span class="text-muted text-decoration-line-through"><fmt:formatNumber value="${c_list.p_price}" pattern="#,###" />원</span>
                                        </c:if>
                                        <span><fmt:formatNumber value="${c_list.p_price*(100-c_list.p_sale)/100}" pattern="#,###" />원</span>
                                    </td>
                                    <td>
                                        <span><fmt:formatNumber value="${c_list.p_price*(100-c_list.p_sale)/100 *c_list.c_cnt}" pattern="#,###" />원</span>
                                    </td>
                                </tr>
                            </tbody>
                            </c:forEach>
                            <tr>
                                <td colspan="4">
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