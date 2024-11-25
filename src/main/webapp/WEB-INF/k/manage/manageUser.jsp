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
                    
                    <div class="">
				        <ul class="pagination justify-content-center my-5">
				          <c:if test="${pageDto.doublePrev}">
					      	<li class="page-item"><a class="page-link" href="manage?page=${pageDto.startPage-1}&${pageDto.cri.qs}"><i class="fa-solid fa-angles-left"></i></a></li>
					      </c:if>
					      <c:if test="${pageDto.prev}">
				       	  	<li class="page-item"><a class="page-link" href="list?page=${pageDto.cri.page-1}&${pageDto.cri.qs}"><i class="fa-solid fa-angle-left"></i></a></li>
				          </c:if>
				
				          <c:forEach begin="${pageDto.startPage}" end="${pageDto.endPage}" var="page">
				          	<li class="page-item ${page == pageDto.cri.page ? 'active' : ''}"><a class="page-link" href="list?page=${page}&amount=${pageDto.cri.amount}&category=${pageDto.cri.category}" >${page}</a></li>
				          </c:forEach>
				 
				          <c:if test="${pageDto.next}">
					      	<li class="page-item"><a class="page-link" href="list?page=${pageDto.cri.page+1}&${pageDto.cri.qs}"><i class="fa-solid fa-angle-right"></i></a></li>
					      </c:if>
					      <c:if test="${pageDto.doubleNext}">
					      	<li class="page-item"><a class="page-link" href="list?page=${pageDto.endPage+1}&${pageDto.cri.qs}"><i class="fa-solid fa-angles-right"></i></a></li>
					      </c:if>
				        </ul>
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