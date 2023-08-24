<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOC TYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
</script>
<head>
    <title>
        주문관리
    </title>
</head>

<body>
<%@ include file="/resources/include/header.jsp" %>
    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-1 justify-content-center">
            <c:forEach items="${o_list}" var="o_list">
            <table class="table">
                <tbody>
                    <tr>
                        <div>
                            <p><span>주문번호</span><a href="/admin/shop/orderView?n=${orderList.o_idx}">${o_list.o_idx}</a></p>
                        </div>
                    </tr>
                    <tr>
                        <div>
                            <p><span>주문자</span>${o_list.o_rec}</p>
                        </div>
                    </tr>
                    <tr>
                        <div>
                        <p><span>수령인</span>${o_list.o_idx}</p>
                        </div>
                    </tr>
                    <tr>
                        <div>
                        <p><span>주소</span>(${o_list.m_addr1}) ${o_list.m_addr2} ${o_list.m_addr3}</p>
                        </div>
                    </tr>
                    <tr>
                        <div>
                        <p><span>가격</span ><fmt:formatNumber pattern="###,###,###" value="${o_list.o_totalprice}" /> 원</p>
                        </div>
                    </tr>
                </tbody>
            </table>
            </c:forEach>
            </div>
        </div>
    </section>
<%@ include file="/resources/include/footer.jsp" %>
</body>
</html>