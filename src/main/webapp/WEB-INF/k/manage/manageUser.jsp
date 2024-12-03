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
                <h3><i class="fa-solid fa-chart-simple pe-2"></i>관리</h3>
                <!-- navtab -->
				<jsp:include page="manageTab.jsp"></jsp:include>
                <!-- 관리 -->
                <div class="tab-content">
                    <div class="tab-pane fade p-4 show active">
                        <h3>유저 관리</h3>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">NickName</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">grade</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="user" items="${users}">
	                                <tr class="move" style="cursor: pointer" data-user-id="${user.id}">
	                                    <td>${user.id}</td>
	                                    <td>${user.name}</td>
	                                    <td>${user.nickName}</td>
	                                    <td>${user.gender}</td>
	                                    <td>${user.grade}</td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    
                    <jsp:include page="../common/paging.jsp"></jsp:include>
                    
                </div>
            </div>
        </div>
	</div>        
    <script>
    	$(".move").click(function(){
    		location.href = ${cp}+"manage/userDetail?id="+ $(this).data("userId");
    	});
    </script>
</body>
</html>