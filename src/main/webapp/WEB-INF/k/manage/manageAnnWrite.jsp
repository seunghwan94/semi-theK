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
                        <form>
	                        <div class="card">
	                            <div class="card-header">
	                                <div class="input-group flex-nowrap">
	                                    <span class="input-group-text" id="addon-wrapping">제목</span>
	                                    <input type="text" class="form-control" value="" name="title">
	                                </div>
	                            </div>
	                            <div class="card-body">
	                                <div class="input-group mb-3">
	                                    <span class="input-group-text" id="inputGroup-sizing-default">Name</span>
	                                    <input type="text" class="form-control" value="${userInfo.name}" name="name">
	                                    <jsp:include page="../common/writer.jsp"></jsp:include>
	                                    
	                                    
	                                </div>
	                                <div class="input-group mb-3">
	                                    <span class="input-group-text" id="inputGroup-sizing-default">NickName</span>
	                                    <input type="text" class="form-control" value="${userInfo.nickName}" name="nickName">
	                                </div>
	                                <div>
	                                    <label for="exampleInputPassword1" class="form-label">Password</label>
	                                    <div class="d-flex">
	                                        <input type="password" class="form-control w-50" id="exampleInputPassword1" value="${userInfo.pw}" name="pw" placeholder="Password" readonly>
	                                        <button class="btn btn-secondary ms-4 btn-reset"  onclick="$('#pwReset').val('Y');">비밀번호 초기화</button>
	                                    </div>
	                                    <div class="d-flex justify-content-start">
	                                        <div class="w-50">
	                                            <label class="form-label mt-4">Gender</label>
	                                            <div class="d-flex">
	                                                <div class="form-check me-3">
	                                                    <input class="form-check-input" type="radio" name="gender" id="optionsRadios1" value="null" ${userInfo.gender == null ?  'checked':''} disabled>
	                                                    <label class="form-check-label" for="optionsRadios1" >Not yet</label>
	                                                </div>
	                                                <div class="form-chec me-3">
	                                                    <input class="form-check-input" type="radio" name="gender" id="optionsRadios2" value="M" ${userInfo.gender == 'M' ?  'checked':''}>
	                                                    <label class="form-check-label" for="optionsRadios2">Man</label>
	                                                </div>
	                                                <div class="form-check me-3">
	                                                    <input class="form-check-input" type="radio" name="gender" id="optionsRadios3" value="W" ${userInfo.gender == 'W' ?  'checked':''}>
	                                                    <label class="form-check-label" for="optionsRadios3">Woman</label>
	                                                </div>
	                                            </div>
	                                        </div>
	                                        <div class="w-50">
	                                            <label class="form-label mt-4">Grade</label>
	                                            <div class="d-flex">
	                                                <select class="form-select" name="grade">
	                                                    <option value="일반등급" ${userInfo.grade == '일반등급' ? 'selected':''}>일반등급</option>
	                                                    <option value="사업자" ${userInfo.grade == '사업자' ? 'selected':''}>사업자</option>
	                                                    <option value="관리자" ${userInfo.grade == '관리자' ? 'selected':''}>관리자</option>
	                                                    <option value="마스터" ${userInfo.grade == '마스터' ? 'selected':''}>마스터</option>
	                                                </select>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="input-group mt-4">
	                                    <span class="input-group-text" id="inputGroup-sizing-default">주소</span>
	                                    <input type="text" class="form-control" name="addr" value="${userInfo.addr}">
	                                </div>
	                                <div class="input-group my-4">
	                                    <span class="input-group-text" id="inputGroup-sizing-default">상세 주소</span>
	                                    <input type="text" class="form-control" name="detailAddr" value="${userInfo.detailAddr}">
	                                </div>
	                                
	                            </div>
	                            
	                        </div>
	                        <div class="d-flex justify-content-end mt-4 me-2">
	                            <button class="btn btn-secondary btn-submit" >변 경</button>
	                        </div>
                        </form>
                        
                    </div>
            	</div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    	if("${ck}"=="BY") {alert("비밀번호 '12345'로 변경되었습니다.");}
    	if("${ck}"=="Y") {alert("변경 하셨습니다.");}
    	if("${ck}"=="N") {alert("변경에 실패하셨습니다.");}
    </script>
</body>
</html>