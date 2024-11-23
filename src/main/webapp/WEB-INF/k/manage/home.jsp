<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
<head>
<meta charset="UTF-8">
	<jsp:include page="../common/head.jsp"/>
	<link rel='stylesheet'href='css/manage.css'>
</head>
<body>
<body class="gothic-a1-regular">
    <div class="d-flex align-items-start">
    	
        <jsp:include page="sidebar.jsp"></jsp:include>

        <div class="tab-content w-100" id="v-pills-tabContent">
            <div class="tab-pane fade p-5 show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                <h3>Home</h3>
                <div class="d-flex">
                    <div class="col-auto col-sm-4 p-3">
                        <div class="card text-white bg-dark mb-3">
                            <div class="card-header">총 회원</div>
                            <div class="card-body">
                                <h3 class="card-title">24,212 명</h3>
                                <p class="card-text">지금까지 가입한 회원 수</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-auto col-sm-4 p-3">
                        <div class="card text-white bg-dark mb-3">
                            <div class="card-header">프로모션 기부 금액</div>
                            <div class="card-body">
                                <h3 class="card-title"><i class="fa-solid fa-won-sign"></i> 24,212</h3>
                                <p class="card-text">지금까지 기부 받은 총 금액</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-auto col-sm-4 p-3">
                        <div class="card text-white bg-dark mb-3">
                            <div class="card-header">추가적인 숫자통계</div>
                            <div class="card-body">
                                <h3 class="card-title"><i class="fa-solid fa-won-sign"></i> 24,212</h3>
                                <p class="card-text">지금까지 가입한 회원 수</p>
                            </div>
                        </div>
                    </div>
                </div>
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

    <script>
        const ctx1 = document.getElementById('myChart1');
        const ctx2 = document.getElementById('myChart2');

        new Chart(ctx1, {
          type: 'bar',
          data: {
            labels: ['11/16', '11/17', '11/18', '11/19', '11/20', '11/21'],
            datasets: [{
              label: '# 하루 방문 수',
              data: [12, 19, 3, 5, 2, 3],
              borderWidth: 1
            },{
              label: '# 남자',
              data: [8, 10, 1, 2, 1, 1],
              borderWidth: 1
            },{
              label: '# 여자',
              data: [4, 9, 2, 3, 1, 2],
              borderWidth: 1
            }]
          },
          options: {
            scales: {
              y: {
                beginAtZero: true
              }
            }
          }
        });

        new Chart(ctx2, {
            type: 'polarArea',
            data: {
                labels: [
                    '서울',
                    '경기도',
                    '충청도',
                    '전라도',
                    '경상도',
                    '강원도'
                ],
                datasets: [{
                    label: 'My First Dataset',
                    data: [11, 16, 7, 3, 14,2],
                    backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(75, 192, 192)',
                    'rgb(255, 205, 86)',
                    'rgb(201, 203, 207)',
                    'rgb(54, 162, 235)',
                    'rgb(54, 162, 0)'
                    ]
                }]
            },
            options: {
                elements: {
                line: {
                    borderWidth: 3
                }
                }
            },
        });
      </script>

</body>
</html>