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
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade p-4 show active" role="tabpanel" aria-labelledby="nav-home-detail-tab">
                        <h3>공지사항 작성</h3>
                        <form name="frm" action="${cp}manage/ann">
	                        <div class="card">
	                            <div class="card-header">
	                                <div class="input-group flex-nowrap my-2">
	                                    <span class="input-group-text" id="addon-wrapping">제 목</span>
	                                    <input type="text" class="form-control"  id="title" value="" name="title">
	                                </div>
	                            </div>
	                            <div class="card-body p-0">
	                            	<jsp:include page="../common/writer.jsp"></jsp:include>
	                            </div>
	                            <div class="card-footer">  
	                                <div class="input-group my-2">
	                                    <span class="input-group-text" id="inputGroup-sizing-default">작성자</span>
	                                    <input type="text" class="form-control" id="writer" name="writer" value="">
	                                </div>
	                            </div>
	                            
	                        </div>
	                        <div class="d-flex justify-content-end mt-4 me-2">
	                        	<button type="button" class="btn btn-outline-secondary btn-remove me-2" >삭제</button>
	                            <button type="button" class="btn btn-secondary btn-add" >등록</button>
	                        </div>
                        </form>
                        
                    </div>
            	</div>
            </div>
        </div>
    </div>
    <script>
    
    	$(".btn-add").click(function(){
    		
    		const title = $("#title").val();
    		const content = $("#editor .ql-editor").html();
    		const userId = $("#writer").val();
    		const data = {title,content,userId}

    		$.ajax({
                url: "${cp}/manage/ann/write",
                type: "post",
                contentType: "application/json; charse=utf-8",
                data: JSON.stringify(data),
                success: function (res) {
                    if (res=="success") {
                        alert("적용 되었습니다.");
                        document.frm.submit();
                    } else {
                        alert("적용 실패하였습니다");
                    }
                },
                error: function () {
                    alert("서버에서 오류가 발생했습니다.");
                }
            });
    	});
    </script>
</body>
</html>