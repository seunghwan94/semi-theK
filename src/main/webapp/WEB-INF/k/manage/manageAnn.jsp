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
			</div>
		</div>
	</div>
	<script>
		$(".move").click(function (){
			const pno = $(this).data("pno");
			location.href = ${cp} + "manage/ann/view?pno=" + pno; 	
		})
	</script>
</body>
</html>