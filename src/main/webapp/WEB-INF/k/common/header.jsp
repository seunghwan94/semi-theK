<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="container-fluid bg-light border-light p-0">
<nav class="navbar navbar-expand-sm justify-content-start" style="background-color: #000;">
<div class="container-fluid">
<a href="#" class="navbar-brand" onclick="alertIntro()" id="Kmp4"><video src="${cp}/files/common/k_intro.mp4" alt="mp4" width="125" muted autoplay playsinline loop></video></a>
<ul class="navbar-nav me-auto list-group d-flex justify-content-around">
	<li class= "nav-item mx-4 small">
		<a class="nav-link float-start text-light m-2" href="${cp}"><i class="fa-solid fa-house"></i> HOME</a>
	</li>	
<c:forEach items="${mainC}" var="m" >
	<c:choose> 
		<c:when test="${m.cno == 4}">
			<li class="nav-item dropdown mx-4 small"><a class="nav-link dropdown-toggle text-white float-start mt-2" href="#" role="button" data-bs-toggle="dropdown">${m.icon} ${m.cname}</a>		
				<ul class="dropdown-menu bg-secondary">
					<c:forEach items="${subC}" var="s">
						<c:if test="${s.parentCno == m.cno}">
							<li class="small"><a class="dropdown-item" href="${cp}list?cno=${s.cno}">${s.icon} ${s.cname} <i class="fa-solid fa-k small"></i>-시판</a></li>
						</c:if>
					</c:forEach>
				</ul>
			</li>
		</c:when>
		<c:when test="${m.cno !=4 and m.cno == 7 }">
			<li class="nav-item dropdown mx-4 small"><a class="nav-link dropdown-toggle text-white float-start mt-2" href="#" role="button" data-bs-toggle="dropdown">${m.icon} ${m.cname} </a>
				<ul class="dropdown-menu bg-secondary">
					<c:forEach items="${subC}" var="s"> 
						<c:if test="${s.parentCno == m.cno}">
							<li class="small"><a class="dropdown-item" href="${cp}list?cno=${s.cno}">${s.icon} ${s.cname} <i class="fa-solid fa-k small"></i> -시판</a></li>
						</c:if>
					</c:forEach>
				</ul>
			</li>
		</c:when>
		<c:when test="${m.cno  == 2}">
			<li class= "nav-item mx-4 small">
				<a class="nav-link float-start text-light m-2" href="${cp}kallery?cno=${m.cno}">${m.icon} ${m.cname} </a>
			</li>	
		</c:when>
		<c:when test="${m.cno  == 1}">
			<li class= "nav-item mx-4 small">
				<a class="nav-link float-start text-light m-2" href="${cp}notice?cno=${m.cno}">${m.icon} ${m.cname} </a>
			</li>	
		</c:when>
		<c:otherwise>
			<li class= "nav-item mx-4 small">
				<a class="nav-link float-start text-light m-2" href="${cp}promotion?cno=${m.cno}">${m.icon} ${m.cname} </a>
			</li>	
		</c:otherwise>
	</c:choose>
</c:forEach>
</ul>
	<form class="d-flex position-relative">
		<input 	class="form-control" type="search" placeholder="검색하기" id="search-input">
	</form>
</div>
</nav>
<script>
	document.querySelector('#Kmp4').addEventListener('click', function(e){
		e.preventDefault();
		alert("인트로 화면으로 이동합니다.")
		// session.invalidate();
		// alert("로그아웃 성공!")
		window.location.href = "${cp}/intro";
	});
</script>
</header>