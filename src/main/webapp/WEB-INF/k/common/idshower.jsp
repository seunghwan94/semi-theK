<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class ="row container mt-0">
	<div class="col-sm-2 small text-white p-0">
		<div class="id-shower my-1">
			<div class="offcanvas offcanvas-start p-1 d-none" id="demo">
            	<div class="offcanvas-header border-bottom border-secondary border-3 d-flex justify-content-end" style="background-color:#000;">
                    <video src="${cp}/files/common/k_intro.mp4" class="offcanvas-title" alt="mp4" width="125" muted autoplay playsinline loop></video>
			        <button type="button" class="btn-close text-reset border" data-bs-dismiss="offcanvas"></button>
			    </div>
			    <div class="offcanvas-body video-container overflow-hidden position-relative m-0">
					<div class="justify-content-center z-3 position-absolute" >
					    <a class="text-decoration-none text-light fw-big" href="${cp}mypage?id=${userRealId}"><i class="fa-solid fa-image-portrait"></i> 마이페이지 </a>
					    <hr class="bg-light">
					    <a class="text-decoration-none text-light fw-big" href="${cp}intro"><i class="fa-solid fa-right-from-bracket"></i> 로그아웃 </a>
					    <hr class="bg-light">
					    <a class="text-decoration-none text-light fw-big" href="${cp}aboutus"><i class="fa-solid fa-users-gear"></i> K - 소개 </a>
					    <hr class="bg-light">
					    <a class="text-decoration-none text-light fw-big" href="#"><i class="fa-solid fa-sitemap"></i> 내 문의 </a>
					    <hr class="bg-light">
					</div>
                    <video class="position-relative z-n1" autoplay muted loop>
						<source src="${cp}/files/common/k_sidebar.mp4" type="video/mp4" />
					</video>
			    </div>
			</div>
		<button class="btn btn-outline-light mt-1 btn-sm small mx-3" type="button" data-bs-toggle="offcanvas" data-bs-target="#demo" id="sidebar-btn"> hello! ${user.id} </button>
		</div>
	</div>
	<div class="col-sm-10 small"></div>
</div>
<script>
	$(function(){
		$("#sidebar-btn").click(function(){
			$("#demo").removeClass("d-none")
		});
	});
</script>