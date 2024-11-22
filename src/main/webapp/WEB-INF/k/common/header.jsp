<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header class="container-fluid bg-light border-light">
<div>
<nav class="navbar navbar-expand-sm fixed-top justify-content-start" style="background-color: #000;">
<div class="container-fluid">
<a href="#" class="navbar-brand"> <video src="../K/src/main/webapp/WEB-INF/k/files/common/k_intro.mp4" alt="mp4" width="125" muted autoplay playsinline loop></video>
</a>
<ul class="navbar-nav me-auto list-group">
<li class="nav-item mx-5"><a class="nav-link float-start text-light" href="#"><i class="fa-solid fa-house-flag"></i>&nbsp;&nbsp; <b>공지사항</b> </a></li>
<li class="nav-item mx-5"><a class="nav-link float-start text-light" href="#"><i class="fa-solid fa-image"></i>&nbsp;&nbsp; <b>Kallery</b> </a></li>
<li class="nav-item mx-5"><a class="nav-link float-start text-light" href="#"><i class="fa-solid fa-rectangle-ad"></i>&nbsp;&nbsp; <b>프로모션</b> </a></li>
<li class="nav-item dropdown mx-5"><a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown"><i class="fa-solid fa-signs-post"></i>&nbsp;&nbsp;<b> K - 시판</b></a>
<ul class="dropdown-menu">
<li><a class="dropdown-item" href="#"> 자유게시판</a></li>
<li><a class="dropdown-item" href="#"> 정보게시판</a></li>
<li><a class="dropdown-item" href="#"> 모임게시판</a></li>
</ul></li>
</ul>
<form class="d-flex">
<button class="btn btn-outline-dark text-white" type="button" id="searchbtn">
<i class="fa-solid fa-magnifying-glass fw-big"></i>&nbsp;&nbsp;검색하기</button>
<div class="globalnav-searchfield-wrapper">
<input placeholder="검색" autocorrect="off" autocapitalize="off"	autocomplete="off" spellcheck="false" class="globalnav-searchfield-input" type="hidden">
<div></div>
</form>
</div>
</div>
</nav>
<div class="container-fluid"></div>
</div>
</header>