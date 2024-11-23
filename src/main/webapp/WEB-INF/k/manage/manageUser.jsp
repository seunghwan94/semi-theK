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
        <div class="tab-content w-100" id="v-pills-tabContent">
            <div class="tab-pane fade p-5 show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                <h3>관리</h3>
                <!-- navtab -->
				<jsp:include page="manageTab.jsp"></jsp:include>
                <!-- 관리 -->
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade p-4 show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                        <h3>유저 관리</h3>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">No</th>
                                    <th scope="col">Id</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">NickName</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">grade</th>
                                    <th scope="col">last_login</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="user" items="${users}" varStatus="status">
	                                <tr class="move" data-user-id="${user.id}">
	                                    <th>${status.count}</th>
	                                    <td>${user.id}</td>
	                                    <%-- <td>${user.name}</td> --%>
	                                    <td>상조장</td>
	                                    <td>${user.nickName}</td>
	                                    <td>M</td>
	                                    <td>마스터</td>
	                                    <td>${user.createDate}</td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
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