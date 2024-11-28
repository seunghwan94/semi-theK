<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
<head>
	<jsp:include page="../common/head.jsp"/>
	<link rel='stylesheet'href='${cp}css/manage.css'>
</head>
<body>
<body class="gothic-a1-regular">
    <div class="d-flex align-items-start">
        <jsp:include page="sidebar.jsp"></jsp:include>
		<!-- main -->
        <div class="tab-content w-100">
            <div class="tab-pane fade p-5 show active">
                <h3>관리</h3>
                <!-- navtab -->
				<jsp:include page="manageTab.jsp"></jsp:include>
                <!-- 관리 -->
                <div class="tab-content">
                    <div class="tab-pane fade p-4 show active">
                        <h3>공지사항 관리</h3>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">No</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col">viewCnt</th>
                                    <th scope="col">create</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="post" items="${annPost}" varStatus="status">
	                                <tr class="move" data-user-pno="${post.pno}">
	                                    <th>${status.count}</th>
	                                    <td>${post.title}</td>
	                                    <td>${post.userId}</td>
	                                    <td>${post.viewCnt}</td>
	                                    <td>${post.createDate}</td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <jsp:include page="../common/paging.jsp"></jsp:include>
                    </div>
				</div>	
			</div>
		</div>
	</div>
</body>
</html>