<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
<head>
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
                <h3><i class="fa-solid fa-bullhorn pe-2"></i>통계</h3>
                <div class="d-flex justify-content-between pt-0 fw-bold ">
                    <div class="col-auto col-xl-8 p-3">
                        <div class="card col-12 col-xl-11  border-dark mb-3 h-100">
                            <div class="card-header">하루 평균 방문자수</div>
                            <div class="card-body bg-light">
                                <canvas id="myChart1"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-auto col-xl-4 p-3">
                        <div class="card col-12 col-xl-11 border-dark mb-3 h-100">
                            <div class="card-header">가입 지역</div>
                            <div class="card-body bg-light">
                                <canvas id="myChart2"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
   </div>
</body>
</html>