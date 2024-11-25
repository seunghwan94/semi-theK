<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header class="container-fluid bg-light border-light">
<nav class="navbar navbar-expand-sm fixed-top justify-content-start border-bottom border-light border-3" style="background-color: #000;">
<div class="container-fluid">
<a href="${cp}/index" class="navbar-brand"><video src="${cp}/files/common/k_intro.mp4" alt="mp4" width="125" muted autoplay playsinline loop></video></a>
<ul class="navbar-nav me-auto list-group">
<c:forEach items="${categories}" var="c">
	<li class= "nav-item mx-5"><a class="nav-link float-start text-light" href="${cp}/notice"><b>${c}</b></a></li>
</c:forEach>
<li class="nav-item mx-5"><a class="nav-link float-start text-light" href="${cp}/notice"><i class="fa-solid fa-house-flag"></i>&nbsp;&nbsp;<b>공지사항</b></a></li>
<li class="nav-item mx-5"><a class="nav-link float-start text-light" href="${cp}/promotion"><i class="fa-solid fa-image"></i>&nbsp;&nbsp;<b>Kallery</b></a></li>
<li class="nav-item mx-5"><a class="nav-link float-start text-light" href="${cp}/promotion"><i class="fa-solid fa-rectangle-ad"></i>&nbsp;&nbsp;<b>프로모션</b></a></li>
<li class="nav-item dropdown mx-5"><a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown"><i class="fa-solid fa-signs-post"></i>&nbsp;&nbsp;<b>K - 시판</b></a>
<ul class="dropdown-menu bg-secondary">
<li><a class="dropdown-item" href="${cp}/menu1">메뉴 1</a></li>
<li><a class="dropdown-item" href="${cp}/menu2">메뉴 2</a></li>
</ul></li>
<li class="nav-item dropdown mx-5"><a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown">&nbsp;&nbsp;<b><i class="fa-solid fa-bars"></i></b></a>
<ul class="dropdown-menu bg-secondary">
<c:forEach items="${categories}" var="c">

</c:forEach>
<li><a class="dropdown-item" href="${cp}/menu1"></a></li>
<li><a class="dropdown-item" href="${cp}/menu2"></a></li>
</ul></li>
</ul>
<form class="d-flex position-relative">
<input class="form-control" type="search" placeholder="..." id="search-input">
</form>
</div>
</nav>
<div id="search-helper" class="d-none position-absolute w-100 bg-white top-100 start-0 border shadow opacity-50" style="height: 30vh;">
<div class="p-3">
<h5 class="border-bottom pb-2">실시간 검색어</h5>
<ul class="list-unstyled">
<li>1${cp}</li>
<li>2${cp}</li>
<li>3${cp}</li>
</ul>
<h5 class="border-bottom pb-2 mt-3">실시간 게시판</h5>
<ul class="list-unstyled">
<li>1${cp}</li>
<li>2${cp}</li>
<li>3${cp}</li>
</ul>
</div>
</div>
</header>