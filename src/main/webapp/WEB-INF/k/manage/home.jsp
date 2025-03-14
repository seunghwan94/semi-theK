<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        <div class="tab-content w-100" id="v-pills-tabContent">
            <div class="tab-pane fade p-5 show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                <h3><i class="fa-solid fa-house pe-2"></i>Home</h3>
                
                
                <div class="d-flex">
                    <div class="col-auto col-sm-4 p-3">
                        <div class="card text-white bg-dark mb-3">
                            <div class="card-header">총 회원</div>
                            <div class="card-body">
                                <h3 class="card-title d-flex justify-content-between"><i class="fa-solid fa-user"></i>${userTotal[0].cnt} 명</h3>
                                <p class="card-text">지금까지 가입한 회원 수</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-auto col-sm-4 p-3">
                        <div class="card text-white bg-dark mb-3">
                            <div class="card-header">총 게시글</div>
                            <div class="card-body">
                                <h3 class="card-title d-flex justify-content-between"><i class="fa-solid fa-signs-post"></i>${postTotal[0].cnt} 개</h3> 
                                <p class="card-text">총 게시판 글수</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-auto col-sm-4 p-3">
                        <div class="card text-white bg-dark mb-3">
                            <div class="card-header">총 좋아요</div>
                            <div class="card-body">
                                <h3 class="card-title d-flex justify-content-between"><i class="fa-solid fa-heart"></i>${likeTotal[0].cnt} 개</h3>
                                <p class="card-text">지금까지 좋아요 눌린 수</p>
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
                            <div class="card-header">성별</div>
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
          type: 'line',
          data: {
            labels: ['${userCreateTotal[5].target}', 
            		 '${userCreateTotal[4].target}', 
            		 '${userCreateTotal[3].target}', 
            		 '${userCreateTotal[2].target}', 
            		 '${userCreateTotal[1].target}', 
            		 '${userCreateTotal[0].target}'],
            datasets: [{
            	label: '회원 가입 현황',
                data: [  '${userCreateTotal[5].cnt}', 
		           		 '${userCreateTotal[4].cnt}', 
		        		 '${userCreateTotal[3].cnt}', 
		        		 '${userCreateTotal[2].cnt}', 
		        		 '${userCreateTotal[1].cnt}', 
		        		 '${userCreateTotal[0].cnt}'],
                fill: false,
                borderColor: 'rgb(75, 192, 192)',
                tension: 0.1
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
                    'Null',
                    '남자',
                    '여자'
                ],
                datasets: [{
                    label: 'My First Dataset',
                    data: [${genderTotal[0].cnt}, ${genderTotal[1].cnt}, ${genderTotal[2].cnt}],
                    backgroundColor: [
                    	'rgb(255, 205, 86)',
                    	'rgb(54, 162, 235)',
                    	'rgb(255, 99, 132)',
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