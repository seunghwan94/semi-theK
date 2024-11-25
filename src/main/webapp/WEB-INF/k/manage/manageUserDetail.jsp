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
                        <h3>상세 정보</h3>
                        <div class="card">
                            <div class="card-header">
                                <div class="input-group flex-nowrap">
                                    <span class="input-group-text" id="addon-wrapping">Email</span>
                                    <input type="text" class="form-control" value="${email}" disabled>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="input-group mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-default">Name</span>
                                    <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                </div>
                                <div class="input-group mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-default">NickName</span>
                                    <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                </div>
                                <div>
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <div class="d-flex">
                                        <input type="password" class="form-control w-50" id="exampleInputPassword1" placeholder="Password" disabled>
                                        <button type="button" class="btn btn-secondary ms-4 ">비밀번호 초기화</button>
                                    </div>
                                    <div class="d-flex justify-content-start">
                                        <div class="w-50">
                                            <label class="form-label mt-4">Gender</label>
                                            <div class="d-flex">
                                                <div class="form-check me-3">
                                                    <input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
                                                    <label class="form-check-label" for="optionsRadios1">Not yet</label>
                                                </div>
                                                <div class="form-chec me-3">
                                                    <input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                                                    <label class="form-check-label" for="optionsRadios2">Man</label>
                                                </div>
                                                <div class="form-check me-3">
                                                    <input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                                                    <label class="form-check-label" for="optionsRadios2">Woman</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="w-50">
                                            <label class="form-label mt-4">Grade</label>
                                            <div class="d-flex">
                                                <select class="form-select" aria-label="Default select example">
                                                    <option selected>일반등급</option>
                                                    <option value="1">사업자</option>
                                                    <option value="2">관리자</option>
                                                    <option value="3">마스터</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="input-group mt-4">
                                    <span class="input-group-text" id="inputGroup-sizing-default">주소</span>
                                    <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                </div>
                                <div class="input-group my-4">
                                    <span class="input-group-text" id="inputGroup-sizing-default">상세 주소</span>
                                    <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                </div>
                                
                            </div>
                            
                        </div>
                        <div class="d-flex justify-content-end mt-4 me-2">
                            <button class="btn btn-secondary">변 경</button>
                        </div>
                    </div>
                    
            </div>
        </div>
    </div>
</body>
</html>