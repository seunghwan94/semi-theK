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
                        
                        
                        	<form id="frm">
	                            <div class="d-flex flex-row justify-content-center align-items-center">
	                                <!-- 비적용 (왼쪽) -->
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
	                                        <div class="input-group mb-3">
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
	                                
	                                
	                                
	                                
	                                
	                                <!-- 적용 (오른쪽) -->
	                                <div class="card m-3 bg-light w-50">
	                                    <div class="card-header text-dark">적용</div>
	                                    <div class="card mb-3">
		                                    <ul class="list-group list-group-flush connectedSortable ">
		                                       	<li class="list-group-item ui-state-highlight text-secondary">공지사항</li>
		                                       	<li class="list-group-item ui-state-highlight text-secondary">Kallery</li>
		                                       	<li class="list-group-item ui-state-highlight text-secondary">프로모션</li>
		                                    </ul>
	                                    </div>
	                                    
	                                    <div class="card mb-3">
		                                    <ul class="list-group list-group-flush connectedSortable">
		                                       	<li class="list-group-item ui-state-highlight text-secondary">K - 시판</li>
		                                    </ul>
		                                    
		                                    
		                                    <ul id="sortable2" class="list-group list-group-flush connectedSortable grabbable">
		                                        <c:forEach var="m" items="${menuCategory}">
		                                    		<c:if test="${m.parentCno==4 && m.isUse == 'y'}">
			                                        	<li class="list-group-item ui-state-highlight">${m.cname}</li>
			                                        </c:if>
		                                    	</c:forEach>
		                                    </ul>
	                                  	</div>
	                                  	
	                                  	<div class="card mb-3">
		                                    <ul class="list-group list-group-flush connectedSortable">
		                                       	<li class="list-group-item ui-state-highlight text-secondary">기타</li>
		                                    </ul> 
		                                    <ul id="sortable3" class="list-group list-group-flush connectedSortable grabbable">
		                                        <c:forEach var="m" items="${menuCategory}">
		                                    		<c:if test="${m.parentCno==7 && m.isUse == 'y'}">
			                                        	<li class="list-group-item ui-state-highlight">${m.cname}</li>
			                                        </c:if>
		                                    	</c:forEach>
		                                    </ul>
	                                    </div>
	                                    
	                                    <div class="card-footer p-0 d-none"></div>
	                                </div>
	                            </div>
	                            <div class="d-flex justify-content-end">
	                                <button class="btn btn-secondary" type="button" id="btn-mune-modify">적용</button>
	                            </div>
							</form>	 
							
							                           
                        </div>
                    </div>
               	</div>
            </div>
       </div>
   </div>
	<script>
		/* 드레그앤 드랍 */
        $( function() {
            $( "#sortable1, #sortable2, #sortable3" ).sortable({
                connectWith: ".connectedSortable"
            }).disableSelection();
        });
        /* 적용 버튼 클릭시 */
        $("#btn-mune-modify").click(function (event) {
        	/* .index라는 */
        	/* <ul>
	        	<li data-cno="1">고정1</li>
	        	<li data-cno="2">고정2</li>
	        	<li data-cno="3">고정3</li>
	        	<li data-cno="4">고정4/li>
        	</ul 
        	arr = [];
        	let obj = {
        			sort: $(this).index(),
        			cno: $(this).data("cno"),
        			text: $(this).text(),
        			parent : $(this).parent().find("li:first").data("cno");
        				}
        	
        	arr.push(obj);
        	
        	*/
        	
        	
            let lArr = [];
            $("#sortable1 li").each(function () {
            	lArr.push($(this).text().trim());
            });
            
            let r4Arr = [];
            $("#sortable2 li").each(function () {
            	r4Arr.push($(this).text().trim());
            });
            
            let r7Arr = [];
            $("#sortable3 li").each(function () {
            	r7Arr.push($(this).text().trim());
            });
            
            let test = [{ 
            	cno : 1,
            	sort : 1,
            	parent : 2,
            	isuse: 'y'
            }];
            
            
            
            const data = {
            		lArr :  lArr,
            		r4Arr : r4Arr,
            		r7Arr : r7Arr
            }
            
            $.ajax({
                url: "${cp}/manage/menu",
                type: "PUT",
                contentType: "application/json",
                data: JSON.stringify(data),
                
                
                success: function (res) {
                	
                	
                    if (res=='success') {
                        $("#sortable1").append(`<li class="list-group-item ui-state-default">\${addMenu}</li>`);
                        $(".input-group > input").val(""); 
                        $("#menu-input").addClass("d-none");
                        alert("메뉴가 추가되었습니다.");
                        
                    } else {
                        alert("같은 이름의 메뉴가 있습니다.");
                    }
                },
                error: function () {
                    alert("서버 오류가 발생했습니다.");
                }
            });
            
            
        });
        
        
        /* + 버튼 클릭시 */
        $(document).on('change','.input-group',function(){   
        	const addMenu = $.trim($(".input-group > input").val());
        	$.ajax({
                url: "${cp}/manage/menu",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify({ cname: addMenu }),
                success: function (res) {
                    if (res=='success') {
                        $("#sortable1").append(`<li class="list-group-item ui-state-default">\${addMenu}</li>`);
                        $(".input-group > input").val(""); 
                        $("#menu-input").addClass("d-none");
                        alert("메뉴가 추가되었습니다.");
                        
                    } else {
                    	alert("같은 이름의 메뉴가 있습니다.");
                    }
                },
                error: function () {
                    alert("서버 오류가 발생했습니다.");
                }
            });
        	
        })
        
        
        /* 메뉴 추가 시 */        
        $("#btn-meun-input").click(function(){
            $("#menu-input").removeClass("d-none");
        });

    </script>
</body>
</html>