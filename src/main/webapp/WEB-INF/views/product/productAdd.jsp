<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

</script>
    <%@ include file="/resources/include/header.jsp" %>

        <!-- Section-->
        <section class="py-5">

            <form action="/productAddProcess.do" method="post">
                <input type="text" name="p_name" placeholder="상품명">
                <input type="text" name="p_img1" placeholder="상품이미지">
                <input type="text" name="p_price" placeholder="상품가격" id="m_pw">
                <input type="text" name="p_sale" placeholder="상품할인률" id="m_pw">
                <input type="text" name="p_sale" placeholder="상품할인률" id="m_pw">
                <input type="text" name="p_cnt" placeholder="상품수량">
                <input type="submit" value="상품등록">
            </form>

        </section>

    <%@ include file="/resources/include/footer.jsp" %>