<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
  <div class = "card m-5">
	        <div class = "card-header p-3 text-center"><h1>내 프로필 카드</h1></div>
	        <div class = "card-body p-5">
		        <div class="d-flex justify-content-center">
			        <div class="d-flex rounded text-center flex-column me-5">
			        <div class = "text-center" style="width:300px; height: 300px;">
			            <img class="rounded-circle w-100 h-100 " style="object-fit :cover" src="${cp}files/common/dog.jpg">
			        </div>      	
			          	<div class = "text-center mt-3">
			          		<button class="btn btn-secondary " type="button" id="button-addon2">프로필 사진 변경</button>
			          	</div>
			       	</div>
			       	<div class = "w-100">
					      	<div class="input-group flex-nowrap mb-1">
								  <span class="input-group-text" id="addon-wrapping">닉네임</span>
								  <input type="text" class="form-control text-center " placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping">
								  <button class="btn btn-secondary " type="button" id="">닉네임 변경</button>
							</div>
							<div class="input-group flex-nowrap mb-1">
								  <span class="input-group-text" id="addon-wrapping">이메일</span>
								  <input type="text" class="form-control text-center" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping">
							</div>
							<div class="input-group flex-nowrap mb-1">
								  <span class="input-group-text "  id="addon-wrapping">등급</span>
								  <input type="text" class="form-control text-center" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping">
								  <span class="input-group-text " id="addon-wrapping">성별</span>
								  <input type="text" class="form-control text-center" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping">
								  <button class="btn btn-secondary " type="button" id="">성별 변경</button>
							</div>
							<div class="input-group flex-nowrap mb-1" >
								  <span class="input-group-text " id="addon-wrapping">소개</span>
								  <input type="text" class="form-control text-center" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping">
							</div>
							<div class="input-group flex-nowrap mb-1">
								  <span class="input-group-text " id="addon-wrapping">팔로잉</span>
								  <input type="text" class="form-control text-center" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping">
								  <span class="input-group-text " id="addon-wrapping">팔로워</span>
								  <input type="text" class="form-control text-center" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping">
							</div>
							<div class="input-group flex-nowrap mb-1">
								<span class="input-group-text " id="addon-wrapping">이름</span>
								  <input type="text" class="form-control text-center" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping">
								  <span class="input-group-text " id="addon-wrapping">지역</span>
								  <input type="text" class="form-control text-center" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping">				
							</div> 
							<div class="input-group flex-nowrap mb-3">
								  <span class="input-group-text " id="addon-wrapping">등급</span>
								  <input type="text" class="form-control text-center"  placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping">
							</div>
							  <div class="d-flex justify-content-between">
					            <button class="btn btn-secondary" type="button" id="button-addon2">Language</button> 
					            <button class="btn btn-danger" type="button" id="button-addon2">회원 탈퇴</button>
					          </div> 
					</div>				
				</div>		
	     		</div>
   </div>       
   </div>       