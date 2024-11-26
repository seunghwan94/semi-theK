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
		<hr>
		<div class="mt-5 text-white">
			<hr>
			<h2 class="mt-5 my-4 fw-bold">POSTS</h2>
			<hr>
			<!--
			<c:choose>
				<c:when test="${Param.cno} == 6">
					<h1 class="fw-bold"> 모임 </h1>
				</c:when>
				<c:when test="${Param.cno} == 8">
					<h1 class="fw-bold"> 기타메뉴 </h1>
				</c:when>
				<c:when test="${Param.cno} == 11">
					<h1 class="fw-bold"> 정보 </h1>
				</c:when>
				<c:otherwise>
					<h1 class="fw-bold"> 자유 </h1>
				</c:otherwise>
			</c:choose>
			-->
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
            <tbody >
            	<c:forEach items="${posts}" var="p">
            		<tr>
            			<td>${p.pno}</td>
                   		<td><a href="${cp}list/view?pno=${p.pno}" class="text-white text-decoration-none">${p.title}</a></td>
            			<td><button type="button" class="btn text-decoration-none text-white post-writer" data-bs-toggle="popover" title="${p.userId}" data-bs-content="프로필 정보">${p.userId}</button></td>
           			    <td><fmt:formatDate value="${p.createDate}" pattern="yyyy/MM/dd" /></td>
   	                    <td>${p.viewCnt}</td>
                  		<td>?</td>
            	</c:forEach>
                <tr>
                </tbody>
        </table>
        

        
        <div class="row text-light mt-4 mb-5">
	        <div class="col-sm-2">
	        	<button class="btn btn-outline-light bg-secondary"> <i class="fa-regular fa-pen-to-square"></i> 글 작성하기 </button>
	       	</div>
        	<div class="col-sm-8"></div>
        	<div class="col-sm-2">
       	        <ul class="pagination justify-content-end bg-dark">
		            <li class="page-item bg-dark"><a class="page-link bg-dark text-decoration-none" href="#"><i class="fa-solid fa-angles-left"></i></a></li>
		            <li class="page-item bg-dark active"><a class="page-link bg-dark text-decoration-none" href="#">1</a></li>
		            <li class="page-item bg-dark"><a class="page-link bg-dark text-decoration-none" href="#">2</a></li>
		            <li class="page-item bg-dark"><a class="page-link bg-dark text-decoration-none" href="#">3</a></li>
		            <li class="page-item bg-dark"><a class="page-link bg-dark text-decoration-none" href="#"><i class="fa-solid fa-angles-right"></i></a></li>
            	</ul>
        	</div>
        </div>
        
        
    </main>
	<jsp:include page="../common/footer.jsp"/>
</body>
<script src="${cp}js/profilecard.js"></script>
</html>