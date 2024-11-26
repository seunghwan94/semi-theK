<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/head.jsp"	/>
</head>
<body class="bg-dark">
	<jsp:include page="../common/header.jsp"/>
	<main class="container mt-5">
	<div class="mt-5">
        <h2 class="my-4 fw-bold">POSTS</h2>
        <hr>
		<c:choose>
			<c:when test="${Parma.cno} == 5">
				<h1 class="fw-bold"> 자유 </h1>
			</c:when>
			<c:when test="${Parma.cno} == 6">
				<h1 class="fw-bold"> 모임 </h1>
			</c:when>
			<c:when test="${Parma.cno} == 8">
				<h1 class="fw-bold"> 기타메뉴 </h1>
			</c:when>
			<c:when test="${Parma.cno} == 11">
				<h1 class="fw-bold"> 정보 </h1>
			</c:when>
		</c:choose>
	</div>
        <table class="table table-hover text-center table-dark text-white">
            <thead class="border-bottom border-light">
                <tr>
                    <th style="width: 10%;"> 글 번호 </th>
                    <th> 제목 </th>
                    <th style="width: 15%;"> 작성자 </th>
                    <th style="width: 15%;"> 날짜 </th>
                    <th style="width: 10%;"> 조회수 </th>
                    <th style="width: 10%;"> 댓글 </th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${posts}" var="p">
            		<tr>
            			<td>${p.pno}</td>
                   		<td><a href="${cp}/view?pno=${p.pno}" class="text-white text-decoration-none">${p.title}</a></td>
            			<td><button type="button" class="btn text-decoration-none text-white post-writer" data-bs-toggle="popover" title="${p.userId}" data-bs-content="프로필 정보">${p.userId}</button></td>
           			    <td><fmt:formatDate value="${p.createDate}" pattern="yyyy/MM/dd" /></td>
   	                    <td>${p.viewCnt}</td>
                  		<td>?</td>
            	</c:forEach>
                <tr>
                </tbody>
        </table>
        <ul class="pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="#"><i class="fa-solid fa-angles-left"></i></a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item active"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#"><i class="fa-solid fa-angles-right"></i></a></li>
        </ul>
    </main>
	<jsp:include page="../common/footer.jsp"/>
</body>
<script src="${cp}js/profilecard.js"></script>
</html>