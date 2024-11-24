<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header class="container-fluid bg-light border-light">
<div>
<nav class="navbar navbar-expand-sm fixed-top justify-content-start border-bottom border-light border-3" style="background-color: #000;">
<div class="container-fluid">
<a href="${cp}index" class="navbar-brand"> <video src="${cp}files/common/k_intro.mp4" alt="mp4" width="125" muted autoplay playsinline loop></video></a>
<ul class="navbar-nav me-auto list-group">
<li class="nav-item mx-5"><a class="nav-link float-start text-light" href="${cp}"><i class="fa-solid fa-house-flag"></i>&nbsp;&nbsp; <b>공지사항</b> </a></li>
<li class="nav-item mx-5"><a class="nav-link float-start text-light" href="${cp}promotion"><i class="fa-solid fa-image"></i>&nbsp;&nbsp; <b>Kallery</b> </a></li>
<li class="nav-item mx-5"><a class="nav-link float-start text-light" href="${cp}"><i class="fa-solid fa-rectangle-ad"></i>&nbsp;&nbsp; <b>프로모션</b> </a></li>
<li class="nav-item dropdown mx-5"><a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown"><i class="fa-solid fa-signs-post"></i>&nbsp;&nbsp;<b> K - 시판</b></a></li>
</ul>
<form class="d-flex">
<button class="btn btn-outline-light" type="button" data-bs-toggle="offcnavas" data-bs-target="#demo"><i class="fa-solid fa-magnifying-glass fw-big"></i>&nbsp;&nbsp;검색하기</button>

<div class="offcanvas offcanvas-top" id="demo">
  <div class="offcanvas-header">
    <h1 class="offcanvas-title"><i class="fa-solid fa-magnifying-glass fw-big"></i>&nbsp;&nbsp;검색하기</h1>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
  </div>
  <div class="offcanvas-body">
  </div>
</div>
</form>
</div>	
</div>
</nav>
<div class="container-fluid"></div>
</div>
</header>
<hr>