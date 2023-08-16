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
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div>
                        <div class="orderInfo">
                         <form role="form" method="post" autocomplete="off">

                          <input type="hidden" name="amount" value="${sum}" />

                          <div class="inputArea">
                           <label for="o_rec">수령인</label>
                           <input type="text" name="o_rec" id="o_rec" required="required" />
                          </div>

                          <div class="inputArea">
                           <label for="o_tel">수령인 연락처</label>
                           <input type="text" name="o_tel" id="o_tel" required="required" />
                          </div>

                          <div class="inputArea">
                           <label for="m_addr1">우편번호</label>
                           <input type="text" name="m_addr1" id="m_addr1" required="required" />
                          </div>

                          <div class="inputArea">
                           <label for="m_addr2">1차 주소</label>
                           <input type="text" name="m_addr2" id="m_addr2" required="required" />
                          </div>

                          <div class="inputArea">
                           <label for="m_addr3">2차 주소</label>
                           <input type="text" name="m_addr3" id="m_addr3" required="required" />
                          </div>

                          <div class="inputArea">
                           <button type="submit" class="order_btn">주문</button>
                           <button type="button" class="cancel_btn">취소</button>
                          </div>

                         </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@ include file="/resources/include/footer.jsp" %>
</body>
</html>