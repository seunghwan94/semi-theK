<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
<head>
    <jsp:include page="../common/head.jsp" />
    <link rel='stylesheet' href='css/indexbxslider.css'>
    <link rel='stylesheet' href='css/style.css'>
    
</head>
<body class="bg-dark d-flex flex-column min-vh-100 gothic-a1-regular">
    <jsp:include page="../common/header.jsp" />
    <main class="container my-5 mx-auto p-2 justify-content-center">
        <div id="slide-container">
            <ul class="bxslider1">
                <c:forEach var="u" begin="1" end="5">
                    <li><img src="https://placehold.co/1300x250?text=Slider+${u}" alt="Slide ${u}" /></li>
                </c:forEach>
            </ul>
        </div>
        <div class="container-fluid mt-4 p-2 mx-auto text-center">
            <c:forEach items="${subC}" var="s" varStatus="status">
                <c:if test="${status.index % 2 == 0}">
                    <div class="row align-items-stretch">
                </c:if>
                <div class="col-sm-5 p-3">
                    <hr class="text-light">
                    <b><a href="${cp}list?cno=${s.cno}" class="p-2 mt-4 mb-0 big text-light bg-secondary text-decoration-none">${s.icon} ${s.cname}</a></b>
                    <hr class="text-light">
                    <ul class="p-0 small">
                        <c:forEach items="${posts}" var="p">
                            <c:if test="${s.cno == p.cno}">
                                <li>
                                    <div class="row p-2 border-bottom mx-auto text-light">
                                        <div class="col-sm-1 small">${p.pno}</div>
                                        <div class="col-sm-6 text-truncate">
                                            <a href="${cp}list/view?pno=${p.pno}" class="text-decoration-none text-light">${p.title}</a>
                                        </div>
                                        <div class="col-sm-1">
                                            <a href="#" class="text-decoration-none text-light">[0]</a>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="#" class="text-decoration-none text-light">
                                                <i class="fa-solid fa-heart small"></i>
                                            </a>
                                        </div>
										<div class="col-sm-2 small small small">
										    <fmt:formatDate value="${p.createDate}" pattern="yyyy/MM/dd" />
										</div>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
                <c:if test="${status.index % 2 == 0}">
                    <div class="col-sm-2"></div>
                </c:if>
                
                <c:if test="${status.index % 2 == 1}">
                    </div>
                </c:if>

                <c:if test="${status.index == 1 }">
                    <div class="row justify-content-center mt-4 mb-4">
                        <ul class="col-sm-12 bxslider2">
                            <c:forEach var="bx" begin="1" end="8">
                                <li class="text-start">
                                    <a href="#"><img src="https://placehold.co/170x200?text=gallery+${bx}" alt="Gallery ${bx}" /></a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </main>
    <jsp:include page="../common/footer.jsp" />
    <script src="${cp}js/bxsliderindex.js"></script>
    <script src="${cp}js/searchbar.js"></script>
</body>
</html>
