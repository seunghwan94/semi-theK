<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/head.jsp"	/>
</head>
<body class="bg-dark">
	<jsp:include page="../common/header.jsp"/>
	<main class="container mt-5">
        <h2 class="my-4 fw-bold">POSTS</h2>
        <table class="table table-hover text-center">
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
                   		<td><a href="${cp}/view?pno=${p.pno}" class="text-decoration-none">${p.title}</a></td>
            			<td><button type="button" class="btn text-decoration-none post-writer" data-bs-toggle="popover" title="${p.userId}" data-bs-content="${cp}프로필 정보">${p.userId}</button></td>
           			    <td>${p.createDate}</td>
   	                    <td>${p.viewCnt}</td>
                  		<td>?</td>
            	</c:forEach>
                <tr>
                </tbody>
        </table>
        <ul class="pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item active"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
    </main>
	<jsp:include page="../common/footer.jsp"/>
</body>
<script src="${cp}js/profilecard.js"></script>
</html>