<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
	<head>
		<jsp:include page="../common/head.jsp"	/>
	</head>
	<body class="gothic-a1-regular">
		<jsp:include page="../common/header.jsp"/>
		<div class="wrap">
			<main class="container mt-5 mb-5">
				<p class="small"><i class="small">the-K에서 보증하는 <b class="text-warning">프리미엄 프로모터</b>의 게시글을 만나보세요.</i></p>
				<hr>
				<c:forEach begin="1" end="2">
					<div class="my-4 row align-items-stretch d-flex justify-content-center">
						<c:forEach var="v" begin="1" end="4">
							<div class="col-sm-3">
								<div class="card bg-secondary mx-auto px-1">
									<img class="card-img-top mt-1" src="https://placehold.co/200x200?text=promote" alt="Card image">
									<div class="card-body mx-auto text-center">
										<h4 class="card-title small">별빛 야경과 함께하는 창경궁 투어</h4>
										<div class="border border-warning mx-auto px-auto border-3 small">
											<p class="card-text small">프로모터 : 홍길동</p>
										</div>
										<hr>
										<div class="mb-1 small mt-1">
											<nav aria-label="breadcrumb" class="d-flex justify-content-evenly small">
												<ol class="breadcrumb">
													<li class="breadcrumb-item" aria-current="page">조회수 : </li>
													<li class="breadcrumb-item" aria-current="page">댓글 : </li>
												</ol>
											</nav>
										</div>
										<hr>
										<div class="my-1 small">
											<nav aria-label="breadcrumb" class="d-flex justify-content-evenly small">
												<ol class="breadcrumb">
													<li class="breadcrumb-item" aria-current="page">기간 : </li>
													<li class="breadcrumb-item" aria-current="page">지역 : </li>
												</ol>
											</nav>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:forEach>
				<hr>
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
				<jsp:include page="../common/paging.jsp"/>
			</main>
		</div>
		<jsp:include page="../common/footer.jsp"/>
	</body>