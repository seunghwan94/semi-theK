<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/head.jsp"	/>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<main class="container text-light border-light">
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

        <div class="d-flex bg-light mt-5 ">
            <h3 class="text-start">premium-promotions</h3>
        </div>

        <!-- 프로모션 박스 시작-->
        <div class="row mt-5 promo-box-1">
            <div class="col-sm-6">
                <div class="border border-light border-3">
                    <img src="https://placehold.co/635x150?text=premium-" alt="premium-promo-1" >
                </div>
            </div>
            <div class="col-sm-1">
                <div class="vr"></div>
            </div>
            <div class="col-sm-5 text-center text-light">
                <div class="d-block border-light allign-self-center">
                    <div class="row">
                        <div class="border col-12">
                            promo title
                        </div>
                    </div>
                    <div class="row">
                        <div class="border col-12">
                            <p>promo contentpromo contentpromo content promo contentpromo content promo contentpromo content promo contentpromo content promo contentpromo content promo contentpromo content promo contentpromo content promo contentpromo content promo content</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 프로모션 박스 시작-->

        <div class="row mt-5 promo-box-1">
            <div class="col-sm-6">
                <div class="border border-light border-3">
                    <img src="https://placehold.co/635x150?text=premium-" alt="premium-promo-1" >
                </div>
            </div>
            <div class="col-sm-1">
            </div>
            <div class="col-sm-5 text-center text-light">
                <div class="d-block border-light">
                    <div class="row">
                        <div class="border col-12">
                            promo title
                        </div>
                    </div>
                    <div class="row">
                        <div class="border col-12">
                            <p>promo contentpromo content promo contentpromo content promo contentpromo content promo contentpromo content promo contentpromo content promo contentpromo content promo contentpromo content promo contentpromo content promo contentpromo content promo contentpromo content promo content</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr class="border-light">
        <div class="row">
            <div class="col-sm-6">
                <h3>프로모터가 되고 싶은가? 지금 당장 신청하십시오!</h3>
                <hr class="border-light">
                <p>
                    광고자가 되어 자유롭게 홍보하십시오! 상단에 자신의 광고를 노출시키고 싶으신가요? 우리에게 돈을 바치다.
                    그렇다면 고급 광고자가 될 수 있습니다.
                    취소할까요? 그러나 결제되었습니다. 이 결제는 우리에게 유효한 것입니다.
                    당신의 지갑, 우리의 회식으로 대체되었다.
                    항상 감사하십시오, 이 프로모터들아. and I also, 한국좋아.
                </p>
            </div>
            <div class="col-sm-2"></div>
            <div class="col-sm-4">
                <div>
                    <img src="https://placehold.co/435x150?text=premium-5" alt="premium-promo-1" >
                </div>
            </div>
        </div>

    </main>
    
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>