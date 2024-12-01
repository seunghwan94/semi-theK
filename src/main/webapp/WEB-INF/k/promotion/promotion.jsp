<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
<head>
	<jsp:include page="../common/head.jsp"/>
</head>
<body class="gothic-a1-regular">
	<jsp:include page="../common/header.jsp"/>
	<main class="container text-light border-light flex-grow-1">
        <div id="demo" class="carousel slide mt-5 d-block" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://placehold.co/1300x150?text=the-Kpromo1" alt="Los Angeles" class="d-block">
                </div>
                <div class="carousel-item">
                    <img src="https://placehold.co/1300x150?text=the-Kpromo2" alt="Chicago" class="d-block">
                </div>
                <div class="carousel-item">
                    <img src="https://placehold.co/1300x150?text=the-Kpromo3" alt="New York" class="d-block">
                </div>
            </div>
        </div>
        
        <hr class="border-light">
        <div class="row small">
            <div class="col-sm-6 small">
                <h3>프로모터가 되고 싶은가? 지금 당장 신청하십시오!</h3>
                <hr class="border-light">
                <p class="small">
                    광고자가 되어 자유롭게 홍보하십시오! 상단에 자신의 광고를 노출시키고 싶으신가요?
                    <br> 
                    그렇다면 우리에게 돈을 바치다. 그렇게 고급 광고자가 될 수 있습니다.
                    <br>
                    취소할까요? 그러나 결제되었습니다. 이것은 우리에게 유효. 
                    <br>
                    당신의 지갑, 우리의 회식으로 대체되었다.
                    <br>
                    항상 감사하십시오, 이 프로모터들아. and I also, 한국좋아.
                </p>
            </div>
            <div class="col-sm-2"></div>
            <div class="col-sm-4"><a href="${cp}/promotionlist"></a></div>
        </div>
		<hr>
	</div>
    </main>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>