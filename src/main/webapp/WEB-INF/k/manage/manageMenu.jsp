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
            	<h3>관리</h3>
                <!-- navtab -->
                <jsp:include page="manageTab.jsp"></jsp:include>
                <!-- 관리 -->
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade p-4 show active" role="tabpanel" aria-labelledby="nav-home-detail-tab">
                    	<h3>메뉴 관리</h3>
                        <div class="card p-3">
                            <div class="d-flex flex-row justify-content-center align-items-center">
                                <!-- 비적용 -->
                                <div class="card m-3 bg-light w-50">
                                    <div class="card-header text-dark d-flex align-items-center justify-content-between">
                                        비적용 
                                        <button type="button" class="btn btn-outline-secondary btn-sm" id="btn-meun-input">
                                            <i class="fa-solid fa-plus"></i>
                                        </button>
                                    </div>
                                    <ul id="sortable1" class="list-group list-group-flush connectedSortable mb-2 grabbable">
                                    	<c:forEach var="m" items="${menuCategory}">
                                    		<c:if test="${m.isUse != 'y'}">
	                                        	<li class="list-group-item ui-state-default">${m.cname}</li>
	                                        </c:if>
                                    	</c:forEach>
                                    </ul>
                                    <div class="card-footer p-0 d-none" id="menu-input">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="추가할 메뉴를 작성하세요." aria-label="btn-mune-add" aria-describedby="btn-mune-add">
                                            <button class="btn btn-outline-secondary" type="button" id="btn-mune-add">추가</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- 화살표 -->
                                <div class="icon-arrow-right">
                                    <i class="fa-solid fa-right-long"></i>
                                    <i class="fa-solid fa-down-long d-none"></i>
                                </div>
                                <!-- 적용 -->
                                
                                <div class="card m-3 bg-light w-50">
                                    <div class="card-header text-dark">적용</div>
                                    
                                    <ul id="sortable2" class="list-group list-group-flush connectedSortable mb-2 grabbable">
                                        <c:forEach var="m" items="${menuCategory}">
                                    		<c:if test="${m.isUse == 'y'}">
	                                        	<li class="list-group-item ui-state-highlight">${m.cname}</li>
	                                        </c:if>
                                    	</c:forEach>
                                    </ul>
                                    <div class="card-footer p-0 d-none"></div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end">
                                <button class="btn btn-secondary" type="button" id="btn-mune-add">적용</button>
                            </div>
                        </div>
                    </div>
               	</div>
            </div>
       </div>
   </div>
	<script>
        $( function() {
            $( "#sortable1, #sortable2" ).sortable({
                connectWith: ".connectedSortable"
            }).disableSelection();
        } );
        $("#btn-meun-input").click(function(){
            $("#menu-input").removeClass("d-none");
        });
        $(document).on('change','.input-group',function(){                    
            $("#sortable1").append(`<li class="list-group-item ui-state-highlight">\${$.trim($(".input-group > input").val())}</li>`);
            $(".input-group > input").val("");
            $("#menu-input").addClass("d-none");
        }) 

    </script>
</body>
</html>