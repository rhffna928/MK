<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles.css" rel="stylesheet" />
    </head>

    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/index.do">Start Bootstrap</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/productList.do">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/productNewList.do">신상품</a></li>
                            </ul>
                        </li>
                    </ul>
                    <c:choose>
                        <c:when test="${member.m_grade == 1}"><!-- 로그인이 이루어진 경우 -->
                            <ul class="navbar-nav mb-2 mb-lg-0 ms-lg-4">
                                <li class="dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">${member.m_id}님</a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/memberModi.do?m_idx=${member.m_idx}">개인정보</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout.do">로그아웃</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/Notice">고객센터</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/cartList.do">
                                <i class="bi-cart-fill me-1"></i>
                                Cart
                                <span class="badge bg-dark text-white ms-1 rounded-pill">${cartCnt.cnt}</span>
                            </a>
                        </c:when>
                        <c:when test="${member.m_grade == 2}"><!-- 관리자 -->
                            <ul class="navbar-nav mb-2 mb-lg-0 ms-lg-4">
                                <li class="dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">${member.m_id}님은 관리자</a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout.do">로그아웃</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/memberList.do">회원관리</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/productAdd.do">상품등록</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/productDetail.do">상품관리</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/orderList.do">주문관리</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/Notice">고객센터</a></li>
                                    </ul>
                                </li>
                            </ul>

                        </c:when>
                        <c:otherwise>
                            <ul class="navbar-nav mb-2 mb-lg-0 ms-lg-4">
                                <li class="dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">로그인을 해주세요</a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/login.do">로그인</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/save.do">회원가입</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/Notice">고객센터</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/cartList.do">
                                <i class="bi-cart-fill me-1"></i>
                                Cart
                                <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </nav>
 <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Shop in style</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
                </div>
            </div>
        </header>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
