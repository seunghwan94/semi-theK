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
                    	<h3>금지 단어</h3>
                    	<form name="frm" method="post">
	                        <table class="table table-hover text-center">
	                            <thead>
	                                <tr>
	                                    <th scope="col" style="width: 2%;">
	                                        <div class="form-check">
	                                            <input class="form-check-input" type="checkbox" value="" id="check-all" checked>
	                                        </div>
	                                    </th>
	                                    <th scope="col" style="width: 5%;">No</th>
	                                    <th scope="col" class="text-start">금지 단어</th>
	                                    <th scope="col" style="width: 8%;">작성자</th>
	                                    <th scope="col" style="width: 13%;">등록날짜</th>
	                                    <th scope="col" class="text-start" style="width: 8%;">사용여부</th>
	                                </tr>
	                            </thead>
	                            <tbody>
		                            <c:forEach var="taboo" items="${tabooArr}" varStatus="status">
										<input type="hidden" name="userId" value="${taboo.userId}">
										<input type="hidden" name="isUse" value="${taboo.isUse}">
		                                <tr class="move">
		                                    <th scope="row">
		                                        <div class="form-check">
		                                            <input class="form-check-input" type="checkbox" value="${taboo.keyWord}" name="keyWord">
		                                        </div>
		                                    </th>
		                                    <td>${status.count}</td>
		                                    <td class="text-start">${taboo.keyWord}</td>
		                                    <td>${taboo.userId}</td>
		                                    <td>${taboo.createDate }</td>
		                                    <td>
		                                        <div class="form-check form-switch">
		                                            <input class="form-check-input" type="checkbox" ${taboo.isUse==1 ? "checked" : ""}>
		                                        </div>
		                                    </td>
		                                </tr>
		                           </c:forEach>
	                            </tbody>
	                        </table>
	
	                        <div class="input-group" style="display: none;">
	                            <input type="text" class="form-control" placeholder="금지할 단어를 작성하세요." aria-label="btn-mune-add" aria-describedby="btn-mune-add">
	                            <button class="btn btn-secondary" type="button" id="btn-keyword-add">추가</button>
	                        </div>
	
	                        <div class="d-flex justify-content-end mt-3">
	                            <button type="button" class="btn btn-secondary mt-1 me-2" id="btn-input-add">추가</button>
	                            <button class="btn btn-outline-secondary mt-1 me-2" >삭제</button>
	                            <button class="btn btn-secondary mt-1 me-2" >저 장</button>
	                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
	</div>        

	<script>
         $(document).on('change', '#check-all', function () {
            const isChecked = $(this).is(':checked');
            $('th > div > input').prop('checked', isChecked);
        });
        
        $(document).on('change', 'tbody input[type="checkbox"]', function () {
            const allChecked = $('tbody input[type="checkbox"]').length === $('tbody input[type="checkbox"]:checked').length;
            $('#check-all').prop('checked', allChecked);
        });

        $("#btn-input-add").click(function(){
            $(".input-group").toggle();
            
        });
        $("#btn-keyword-add").click(function() {
        	const taboo = $.trim($(".input-group > input").val());
            $(".input-group > input").val("");
            $(".input-group").hide();
            const str = `<tr>
                            <th scope="row">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
                                </div>
                            </th>
                            <td>\${parseInt($("tbody > tr").last().children("td").eq(0).text()) + 1}</td>
                            <td class="text-start">\${taboo}</td>
                            <td>유진</td>
                            <td>2024-11-22 11:10:10</td>
                            <td>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked>
                                </div>
                            </td>
                        </tr>` ;
            
            $("tbody").append(str);
        });



    </script>
</body>
</html>