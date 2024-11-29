<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
<head>
    <jsp:include page="../common/head.jsp" />
    <jsp:include page="../common/bxslider.jsp" />
    <link rel='stylesheet' href='css/sidebar.css'>
</head>
<style>
    /* 레이어 팝업 영역 */
    .layer-popup {width: 420px; position: absolute; top:150px; left:calc(50% - 210px)}
    .layer-popup img {display: block;}
    .layer-popup p {background-color: rgb(129, 129, 129); color: #eee; margin: 0; padding: 8px; font-size: 13px;} 
    .layer-popup p input {vertical-align: middle;}
    .layer-popup p a {color: #eee; text-decoration: none; float: right;}
</style>
<body class="bg-dark d-flex flex-column min-vh-100 gothic-a1-regular">
    <jsp:include page="../common/header.jsp"/>
    <main class="container my-5 mx-auto p-2 justify-content-center">
    	<div class ="row container mt-3">
			<div class="col-sm-10 small"></div>
			<div class="col-sm-2 small text-white">
				<div class="id-shower my-3">
					<div class="offcanvas offcanvas-start p-1" id="demo">
                        <div class="offcanvas-header border-bottom border-light border-3 d-flex justify-content-end" style="background-color:#000;">
                            <video src="${cp}/files/common/k_intro.mp4" class="offcanvas-title" alt="mp4" width="125" muted autoplay playsinline loop></video>
					        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"></button>
					    </div>
					    <div class="offcanvas-body video-container overflow-hidden position-relative m-0">
                            <div class="justify-content-center z-3 position-absolute" >
                                <a class="text-decoration-none text-light fw-big" href="${cp}mypage"><i class="fa-solid fa-image-portrait"></i> 마이페이지</a>
                                <hr class="bg-light">
                                <a class="text-decoration-none text-light fw-big" href="${cp}intro"><i class="fa-solid fa-right-from-bracket"></i> 로그아웃</a>
                                <hr class="bg-light">
                                <a class="text-decoration-none text-light fw-big" href="${cp}aboutus"><i class="fa-solid fa-right-from-bracket"></i> About US</a>
                                <hr class="bg-light">
                                <a class="text-decoration-none text-light fw-big" href="#"><i class="fa-solid fa-right-from-bracket"></i> 사이트맵</a>
                                <hr class="bg-light">
                            </div>
                            <video class="position-relative z-n1" autoplay muted loop>
								<source src="${cp}/files/common/k_sidebar.mp4" type="video/mp4" />
							</video>
					    </div>
					</div>
					<button class="btn btn-outline-secondary" type="button" data-bs-toggle="offcanvas" data-bs-target="#demo"> 개인 메뉴 열기 </button>
				</div>
			</div>
    	</div>
        <div id="slide-container">
            <ul class="bxslider1">
                <c:forEach var="ps" begin="1" end="5">
                    <li><img src="https://placehold.co/1300x250?text=Slider+${ps}" alt="Slide ${ps}"/></li>
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
                    <b><a href="${cp}list?cno=${s.cno}" class="p-2 mt-4 mb-0 big text-light bg-secondary text-decoration-none">${s.icon} ${s.cname} <i class="fa-solid fa-k small"> - 시판</i></a></b>
                    <hr class="text-light">
                    <ul class="p-0 small">
                        <c:forEach items="${posts}" var="p">
                            <c:if test="${s.cno == p.cno}">
                                <li>
                                    <div class="row p-2 border-bottom border-light mx-auto text-light">
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
                                    <a href="#"><img src="https://placehold.co/170x200?text=gallery+${bx}" alt="Gallery${bx}"/></a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </main>
    <jsp:include page="../common/footer.jsp"/>
    <script src="${cp}js/bxsliderindex.js"></script>
    <script src="${cp}js/searchbar.js"></script>
</body>
</html>