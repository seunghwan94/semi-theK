<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
  <div class = "card m-5">
	        <div class = "card-header p-3 text-center"><h1>내 프로필 카드</h1></div>
	       
	        <form method="post" action="mypage">
		        <div class = "card-body p-5">
			        <div class="d-flex justify-content-center">
				        <div class="d-flex rounded text-center flex-column me-5">
				        <div class = "text-center" style="width:300px; height: 300px;">
				            <img class="rounded-circle w-100 h-100 " id="myImg" style="object-fit :cover" src="${cp}files/common/dog.jpg">
				        </div>      	
				          	<div class = "text-center mt-3">
				          		<button class="btn btn-secondary " type="button" id="button-addon2">프로필 사진 변경</button>
				          	</div>
				       	</div>
					       	<div class = "w-100">
							      	<div class="input-group flex-nowrap mb-1">
										  <span class="input-group-text" id="addon-wrapping">닉네임</span>
										  <input type="text" class="form-control text-center" id="myNickName" value="${userInfo.nickName}" aria-label="nickName" aria-describedby="addon-wrapping">
									</div>
									<div class="input-group flex-nowrap mb-1" >
										  <span class="input-group-text" id="addon-wrapping" >이메일</span>
										  <input type="text" class="form-control text-center" id="myEmail" value="${userInfo.id}" aria-label="userEmail" aria-describedby="addon-wrapping" disabled>
									</div>
									<div class="input-group flex-nowrap mb-1">
										  <span class="input-group-text " id="addon-wrapping"> 성별 </span>
									  <select class="form-select text-center" name="gender" id="myGender">
	                                    <option value="N" ${userInfo.grade == 'N' ? 'selected':''} >Select</option>
	                                    <option value="M" ${userInfo.grade == 'M' ? 'selected':''} >Man</option>
	                                    <option value="W" ${userInfo.grade == 'W' ? 'selected':''} >Woman</option>
	                                 </select>
									</div>
									<div class="input-group flex-nowrap mb-1" >
										  <span class="input-group-text " id="addon-wrapping"> 소개 </span>
										  <input type="text" class="form-control text-center" id="myIntro" value="${userInfo.selfIntro}" aria-label="selfIntro" aria-describedby="addon-wrapping">
									</div>
									<div class="input-group flex-nowrap mb-1">
										  <span class="input-group-text " id="addon-wrapping">팔로잉</span>
										  <input type="text" class="form-control text-center" value="Username" aria-label="Username" aria-describedby="addon-wrapping" disabled>
										  <span class="input-group-text " id="addon-wrapping">팔로워</span>
										  <input type="text" class="form-control text-center" value="Username" aria-label="Username" aria-describedby="addon-wrapping" disabled>
									</div>
									<div class="input-group flex-nowrap mb-1">
										<span class="input-group-text " id="addon-wrapping">이름</span>
										  <input type="text" class="form-control text-center" id="myName" value="${userInfo.name}" aria-label="UserName" aria-describedby="addon-wrapping">
										  <span class="input-group-text " id="addon-wrapping">지역</span>
										  <input type="text" class="form-control text-center" id="myAddr" value="${userInfo.addr}" aria-label="userAddr" aria-describedby="addon-wrapping">
										  <span class="input-group-text " id="addon-wrapping">상세 지역</span>
										  <input type="text" class="form-control text-center" id="myDetailAddr" value="${userInfo.detailAddr}" aria-label="userAddr" aria-describedby="addon-wrapping">					
									</div> 
									<div class="input-group flex-nowrap mb-3">
										  <span class="input-group-text " id="addon-wrapping">프로모션 등급</span>
									<select class="form-select text-center" id="myGrade" name="grade" disabled>
	                                    <option value="일반등급" ${userInfo.grade == '일반등급' ? 'selected':''} >일반등급</option>
	                                    <option value="사업자" ${userInfo.grade == '사업자' ? 'selected':''} >사업자</option>
	                                    <option value="관리자" ${userInfo.grade == '관리자' ? 'selected':''} >관리자</option>
	                                    <option value="마스터" ${userInfo.grade == '마스터' ? 'selected':''} >마스터</option>
	                                </select>
									</div>
									  <div class="d-flex justify-content-between">
							            <button class="btn btn-danger" type="button" id="button-addon2">회원 탈퇴</button>
							            <button class="btn btn-secondary" type="button" id="my-resister-button">저장</button> 
							          </div> 
							</div>				
						</div>								
		     		</div>
		     	</form>
   </div>       
   </div>  
   <script>
$(function() {
   $("#my-resister-button").click(function() {	 
		const myNickName = $("#myNickName").val();
		const myGender = $("#myGender").val();
		const myIntro = $("#myIntro").val();
		const myName = $("#myName").val();
		const myAddr = $("#myAddr").val();
		const myDetailAddr = $("#myDetailAddr").val();
		const id = "${userInfo.id}";
		
		const data = {id
					,"nickName":myNickName
					,"gender":myGender
					,"selfIntro":myIntro	 	
					,"name":myName 	
					,"addr":myAddr	 	
					,"detailAddr":myDetailAddr};	
		console.log(data);
		$.ajax ({
			url : "${cp}mypage",
			type : "post",
			contentType: "application/json; charse=utf-8",
			 data: JSON.stringify(data),
			success : function (data){
				if(data == "success"){
					alert("저장되었습니다.");
					/* location.href="mypage";	 */				
				}else{						
					alert("중복된 닉네임입니다.");								
				} 
				
			}
		})
	})
	
})
   </script>     