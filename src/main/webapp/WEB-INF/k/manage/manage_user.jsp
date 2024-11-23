<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
<head>
<meta charset="UTF-8">
	<jsp:include page="../common/head.jsp"/>
	<link rel='stylesheet'href='css/manage.css'>
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
                <ul class="nav nav-tabs">
                    <li class="nav-item"><a class="nav-link active" href="management.html">유저</a></li>
                    <li class="nav-item"><a class="nav-link" href="management_menu.html">메뉴</a></li>
                    <li class="nav-item"><a class="nav-link" href="management_taboo.html">Taboo</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
                </ul>

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
	                                <tr class="move">
	                                    <th>${status.count}</th>
	                                    <td>${user.id}</td>
	                                    <%-- <td>${user.name}</td> --%>
	                                    <td>상조장</td>
	                                    <td>M</td>
	                                    <td>마스터</td>
	                                    <td>2024-11-22 11:10:10</td>
	                                </tr>
                                </c:forEach>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>test@gmail.com</td>
                                    <td>이승환</td>
                                    <td>짱</td>
                                    <td>M</td>
                                    <td>일반</td>
                                    <td>2024-11-22 11:10:10</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>test@gmail.com</td>
                                    <td>한민</td>
                                    <td>캡</td>
                                    <td>M</td>
                                    <td>관리자</td>
                                    <td>2024-11-22 11:10:10</td>
                                </tr>
                                <tr>
                                    <th scope="row">4</th>
                                    <td>test@gmail.com</td>
                                    <td>유진</td>
                                    <td>초울트라</td>
                                    <td>G</td>
                                    <td>관리자</td>
                                    <td>2024-11-22 11:10:10</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>