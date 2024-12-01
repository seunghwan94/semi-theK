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
            	<h3><i class="fa-regular fa-comment-dots pe-2"></i>QnA</h3>
                <!-- 관리 -->
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade p-4 show active" role="tabpanel" aria-labelledby="nav-home-detail-tab">
                        <form method="post">
                        	<input type="hidden" name="pno" value="${post.pno}">
	                        <div class="card">
	                            <div class="card-header">
	                                <div class="input-group flex-nowrap my-2">
	                                    <span class="input-group-text" id="addon-wrapping">제 목</span>
	                                    <input type="text" class="form-control"  id="title" value="${post.title}" name="title" readonly>
	                                </div>
	                            </div>
	                            <div class="card-body">
	                            	<div>
	                            		${post.content}
	                            	</div>
	                            </div>
	                            <div class="card-footer">  
	                                <div class="input-group my-2">
	                                    <span class="input-group-text" id="inputGroup-sizing-default">작성자</span>
	                                    <input type="text" class="form-control" id="writer" name="writer" value="${post.userId}" readonly>
	                                </div>
	                            </div>
	                        	<jsp:include page="../common/reply.jsp"></jsp:include>
	                            
	                        </div>
	                        <div class="d-flex justify-content-end mt-4 me-2">
	                        	<button class="btn btn-outline-secondary btn-remove me-2" >삭제</button>
	                            <!-- <button type="button" class="btn btn-secondary btn-modify" >변경</button> -->
	                        </div>
                        </form>
                        	
                    </div>
            	</div>
            </div>
        </div>
    </div>
    <script>
    
    	$(".btn-modify").click(function(){
    		const pno = ${post.pno};
    		location.href = `write?pno=\${pno}`;
    	});

    </script>
</body>
</html>