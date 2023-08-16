<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOC TYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$("#cartAdd").on("click",function(e){
        var p_idx = $(this).attr("name").val();
		$.ajax({
			url : "${pageContext.request.contextPath}/cartAdd.do", //호출할 url
			type : 'post', // 호출할 방법(get,post)
			data : "p_idx": p_idx, //서버로 보낼 데이터
			success : function(result){ //요청 성공시 수행될 메서드, 파라미터는 서버가 반환하는 값
				cartAlert(result);
				alert("성공");
			},
		      error: function() {
		          alert("에러 발생");
		      }
		})
	});
	function cartAlert(result){
		if(result == '0'){
			alert("장바구니에 추가를 하지 못하였습니다.");
		} else if(result == '1'){
			alert("장바구니에 추가되었습니다.");
		} else if(result == '2'){
			alert("장바구니에 이미 추가되어져 있습니다.");
		} else if(result == '5'){
			alert("로그인이 필요합니다.");
		}
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
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <!--상품카드-->
                    <c:forEach items="${p_list}" var="p_list">
                    <input type="hidden" name="p_idx" value="${p_list.p_idx}">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <c:if test="${p_list.p_sale != 0}">
                                <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            </c:if>
                            <a href="${pageContext.request.contextPath}/productView.do?p_idx=${p_list.p_idx}">
                                <!-- Product image-->
                                <img class="card-img-top" src="\resources\images${p_list.p_img1}" alt="..." />
                            </a>
                                    <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                            <h5 class="fw-bolder">${p_list.p_name}</h5>
                                            <!-- Product reviews-->
                                            <div class="d-flex justify-content-center small text-warning mb-2">
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                            </div>
                                            <!-- Product price-->
                                            <c:if test="${p_list.p_sale != 0}">
                                            <span class="text-muted text-decoration-line-through"><fmt:formatNumber value="${p_list.p_price}" pattern="#,###" />원</span>
                                            </c:if>
                                            <span><fmt:formatNumber value="${p_list.p_price *(100-p_list.p_sale )/100}" pattern="#,###" />원</span>
                                            </div>
                                        </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                <a class="btn btn-outline-dark mt-auto" href="${pageContext.request.contextPath}/cartAdd.do?p_idx=${p_list.p_idx}&c_cnt=1">장바구니 추가</a>
                                <form class="cart_add" method="get" actions="${pageContext.request.contextPath}/cartAdd.do?}&c_cnt=1">
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>
<%@ include file="/resources/include/footer.jsp" %>
</body>
</html>