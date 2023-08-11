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
                                <col width="40%">
                                <col width="30%">
                                <col width="30%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>상품명</th>
                                    <th>상품갯수</th>
                                    <th>상품가격</th>
                                </tr>
                            </thead>
                            <c:forEach items="${cartlist}" var="c_list">
                             <colgroup>
                                 <col width="40%">
                                 <col width="30%">
                                 <col width="30%">
                             </colgroup>
                            <tbody>
                                <tr>
                                    <td>
                                        ${c_list.p_name}
                                        <img class="card-img-bottom" src="\resources\images${c_list.p_img1}" alt="..." />
                                    </td>
                                    <td>
                                        ${c_list.c_cnt}
                                    </td>
                                    <td>

                                        ${c_list.p_price}
                                    </td>

                                </tr>
                            </tbody>
                            </c:forEach>
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