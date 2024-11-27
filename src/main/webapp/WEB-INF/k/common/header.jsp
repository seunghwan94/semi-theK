<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="container-fluid bg-light border-light p-0">
<nav class="navbar navbar-expand-sm justify-content-start border-bottom border-light border-3" style="background-color: #000;">
<div class="container-fluid">
<a href="${cp}/index" class="navbar-brand"><video src="${cp}/files/common/k_intro.mp4" alt="mp4" width="125" muted autoplay playsinline loop></video></a>
<ul class="navbar-nav me-auto list-group d-flex justify-content-around">
<c:forEach items="${mainC}" var="m" >
	<c:choose> 
		<c:when test="${m.cno == 4}">
			<li class="nav-item dropdown mx-5"><a class="nav-link dropdown-toggle text-white float-start mt-2" href="#" role="button" data-bs-toggle="dropdown">${m.icon} ${m.cname}</a>		
				<ul class="dropdown-menu bg-secondary">
					<c:forEach items="${subC}" var="s"> 
						<c:if test="${s.parentCno == m.cno}">
							<li><a class="dropdown-item" href="${cp}/${s.pathName}">${s.icon} ${s.cname}</a></li>
						</c:if>
					</c:forEach>
				</ul>
			</li>
		</c:when>
		<c:when test="${m.cno !=4 and m.cno == 7 }">
			<li class="nav-item dropdown mx-5"><a class="nav-link dropdown-toggle text-white float-start mt-2" href="#" role="button" data-bs-toggle="dropdown">${m.icon} ${m.cname}</a>
				<ul class="dropdown-menu bg-secondary text-center">
					<c:forEach items="${subC}" var="s"> 
						<c:if test="${s.parentCno == m.cno}">
							<li><a class="dropdown-item" href="${cp}/${s.pathName}"></a>${s.icon} ${s.cname}</li>
						</c:if>
					</c:forEach>
				</ul>
			</li>
		</c:when>
		<c:otherwise>
			<li class= "nav-item mx-5"><a class="nav-link float-start text-light m-2" href="${cp}/${m.pathName}">${m.icon} ${m.cname}</a></li>	
		</c:otherwise>
	</c:choose>
</c:forEach>
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