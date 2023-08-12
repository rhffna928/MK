<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOC TYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

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
                                        <input class="btn btn-outline-dark" name="${c_list.c_idx}" type="button" value="+" id="plus">
                                        <a class="btn" type="text" id="c_cnt" name="c_cnt">${c_list.c_cnt}</a>
                                        <input class="btn btn-outline-dark" name="${c_list.c_idx}" type="button" value="-" id="minus">
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