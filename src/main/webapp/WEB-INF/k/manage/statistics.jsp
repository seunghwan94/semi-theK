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
                    <div class="d-flex flex-column w-100">
                        <div class="card text-white bg-dark mb-3">
                            <div class="card-header">총 회원</div>
                            <div class="card-body">
                                <h3 class="card-title d-flex justify-content-between"><i class="fa-solid fa-user"></i>${userTotal[0].cnt} 명</h3>
                                <p class="card-text">지금까지 가입한 회원 수</p>
                            </div>
                        </div>
                        <div class="card text-white bg-dark mb-3">
                            <div class="card-header">총 게시글</div>
                            <div class="card-body">
                                <h3 class="card-title d-flex justify-content-between"><i class="fa-solid fa-signs-post"></i>${postTotal[0].cnt} 개</h3> 
                                <p class="card-text">총 게시판 글수</p>
                            </div>
                        </div>
                        <div class="card text-white bg-dark mb-3">
                            <div class="card-header">총 좋아요</div>
                            <div class="card-body">
                                <h3 class="card-title d-flex justify-content-between"><i class="fa-solid fa-heart"></i>${likeTotal[0].cnt} 개</h3>
                                <p class="card-text">지금까지 좋아요 눌린 수</p>
                            </div>
                        </div>
	                </div>
	            </div>
	            
	            <div class="d-flex">
		            <div class="col-auto col-xl-4 p-3">
		               <div class="card col-12 col-xl-11 border-dark mb-3 h-100">
		                   <div class="card-header">가입 성별</div>
		                   <div class="card-body bg-light">
		                       <canvas id="myChart2"></canvas>
		                   </div>
		               </div>
		           </div>
	               <div class="card border-dark mb-3 h-100 w-100">
	                   <div class="card-header">카테고리별 게시글</div>
	                   <div class="card-body bg-light">
	                       <canvas id="myChart3"></canvas>
	                   </div>
	               </div>
	           </div>
            </div>
       </div>
   </div>
   <script>
        const ctx1 = document.getElementById('myChart1');
        const ctx2 = document.getElementById('myChart2');
        const ctx3 = document.getElementById('myChart3');
        
        
        new Chart(ctx1, {
          type: 'line',
          data: {
            labels: ['${userCreateTotal[7].target}',
            		 '${userCreateTotal[6].target}',
            		 '${userCreateTotal[5].target}', 
            		 '${userCreateTotal[4].target}', 
            		 '${userCreateTotal[3].target}', 
            		 '${userCreateTotal[2].target}', 
            		 '${userCreateTotal[1].target}', 
            		 '${userCreateTotal[0].target}'],
            datasets: [{
            	label: '회원 가입 현황',
                data: [  '${userCreateTotal[7].cnt}',  
                		 '${userCreateTotal[6].cnt}',  
                		 '${userCreateTotal[5].cnt}', 
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
        
        
        new Chart(ctx3, {
            type: 'bar',
            data: {
              labels: [	 '${postCnoTotal[9].target}',
            	  		 '${postCnoTotal[8].target}',
            	  	     '${postCnoTotal[7].target}',
            	  		 '${postCnoTotal[6].target}',
            	  		 '${postCnoTotal[5].target}', 
	              		 '${postCnoTotal[4].target}', 
	              		 '${postCnoTotal[3].target}', 
	              		 '${postCnoTotal[2].target}', 
	              		 '${postCnoTotal[1].target}', 
	              		 '${postCnoTotal[0].target}'],
              datasets: [{
                  data: ['${postCnoTotal[9].cnt}',
	                	 '${postCnoTotal[8].cnt}',
	                	 '${postCnoTotal[7].cnt}',
	                	 '${postCnoTotal[6].cnt}',
	                	 '${postCnoTotal[5].cnt}', 
  		           		 '${postCnoTotal[4].cnt}', 
  		        		 '${postCnoTotal[3].cnt}', 
  		        		 '${postCnoTotal[2].cnt}', 
  		        		 '${postCnoTotal[1].cnt}', 
  		        		 '${postCnoTotal[0].cnt}'],
                  fill: false,
                  backgroundColor: [
                      'rgba(255, 99, 132, 0.2)',
                      'rgba(255, 159, 64, 0.2)',
                      'rgba(255, 205, 86, 0.2)',
                      'rgba(75, 192, 192, 0.2)',
                      'rgba(54, 162, 235, 0.2)',
                      'rgba(153, 102, 255, 0.2)',
                      'rgba(201, 203, 207, 0.2)'
                    ],
                    borderColor: [
                        'rgb(255, 99, 132)',
                        'rgb(255, 159, 64)',
                        'rgb(255, 205, 86)',
                        'rgb(75, 192, 192)',
                        'rgb(54, 162, 235)',
                        'rgb(153, 102, 255)',
                        'rgb(201, 203, 207)'
                      ],
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
      </script>
      
</body>
</html>