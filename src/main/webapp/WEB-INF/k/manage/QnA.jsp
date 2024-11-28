<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
<head>
	<jsp:include page="../common/head.jsp"/>
	<link rel='stylesheet'href='${cp}css/manage.css'>
	<!-- jquery ui -->
	<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
</head>
<body>
<body class="gothic-a1-regular">
    <div class="d-flex align-items-start">
    	
        <jsp:include page="sidebar.jsp"></jsp:include>
		<!-- main -->
        <div class="tab-content w-100">
            <div class="tab-pane fade p-5 show active">
            	<h3>QnA</h3>
				<div class="tab-pane fade p-4 show active">
                   <table class="table table-hover text-center">
                       <thead>
                           <tr>
                               <th style="width: 5%">No</th>
                               <th >제목</th>
                               <th style="width: 15%">작성자</th>
                               <th style="width: 5%">viewCnt</th>
                               <th style="width: 15%">create</th>
                           </tr>
                       </thead>
                       <tbody>
                       	<c:forEach var="post" items="${annPost}" varStatus="status">
                            <tr class="move" data-pno="${post.pno}">
                                <th>${status.count}</th>
                                <td class="text-start">${post.title}</td>
                                <td>${post.userId}</td>
                                <td>${post.viewCnt}</td>
                                <td>${post.createDate}</td>
                            </tr>
                           </c:forEach>
                       </tbody>
                   </table>
                   <div class="d-flex justify-content-end mt-4 me-2">
                       <a href="${cp}manage/ann/write" type="button" class="btn btn-secondary btn-add" >글쓰기</a>
                   </div>
                   <jsp:include page="../common/paging.jsp"></jsp:include>
               </div>
           	</div>
           	
           	
           	<jsp:include page="../common/reply.jsp"></jsp:include>
           	
           	
       	</div>
   	</div>            	
</body>
</html>