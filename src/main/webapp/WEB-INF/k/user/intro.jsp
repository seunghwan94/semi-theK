<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
<head>
	<jsp:include page="../common/head.jsp" />
  <style>
      body  {
        overflow: hidden;
      }
      video{
        width: 100%;
        height: 100vh;
        object-fit: fill; 
      }
      .gothic-a1-regular {
        font-family: "Gothic A1", sans-serif;
        font-weight: 400;
        font-style: normal;
      }






      
      .class-box{
        position: absolute;
        right: 15%;
        top: 30%;
        z-index: 0;
        width: 20%;
      }
       .login-box{
        margin-bottom: 20%;
        text-align: center;    
      } 
      div > img{
            margin-left:35% ;
            width: 30%;
            height: 40%;
        }

      button >.id_pw{
        margin-left: auto;

      }
      .signpu{
        margin-right: auto;

      }
      
      
  </style>
</head>
  <body class="gothic-a1-regular">
      <div>  
        <video src="${cp}files/common/k_intro.mp4" muted autoplay playsinline></video>
        <div class="class-box text-center">
          <p class="fs-1"style="color: #fff;">한국 여행 어디든</p>
            <div>
                <button type="button" id="signin" class="login-box btn btn-light w-100 m-0" data-bs-toggle="modal" data-bs-target="#signinModal">로그인</button>
                <div class="d-flex justify-content-between">
                  <button type="button" id ="id_pw" class="btn text-secondary p-0" data-bs-toggle= "modal" data-bs-target="#id_pwModal">아이디/비밀번호 찾기</button>             
                  <button type="button" id="signup" class="btn text-secondary p-0" data-bs-toggle="modal" data-bs-target="#signupModal" >회원가입</button>          
                </div> 
            </div> 
        </div>  
      </div>

     
      <div class="modal fade" id="signinModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <img src="${cp}files/common/light_logo.png">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                
                </div>
                    <div class="modal-body">
                        <input type="email" class="form-control my-3" id="email" placeholder="이메일" name="email">                      
                        <input type="password" class="form-control my-3" id="email" placeholder="비밀번호" name="pwd">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-dark">확인</button>
                        <button type="button" class="btn btn-dark" data-bs-dismiss="modal">취소</button>
                    </div>
                  
            </div>
        </div>
      </div>

    <div class="modal fade" id="id_pwModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
              <div class="modal-header">
                  <img src="${cp}files/common/light_logo.png">
                  <h5 class="modal-title" id="exampleModalLabel"></h5>
              </div>
                  <div class="modal-body">
                      <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="이메일" aria-label="이메일" aria-describedby="button-addon2">
                        <button class="btn btn-secondary" type="button" id="button-addon2">이메일 발송</button>
                      </div>
                        <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="이메일 인증" aria-label="이메일 인증" aria-describedby="button-addon2">
                        <button class="btn btn-secondary" type="button" id="button-addon2">확인</button>
                     </div>
                  </div>

                  <div class="modal-footer">
                      <button type="button" class="btn btn-dark">확인</button>
                      <button type="button" class="btn btn-dark" data-bs-dismiss="modal">취소</button>
                </div>
          </div>
      </div>
  </div>



      <div class="modal fade" id="signupModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <img src="${cp}files/common/light_logo.png">
                    <h5 class="modal-title" id="signupModalLabel"></h5>
                 
                </div>
                    <div class="modal-body">
                        <input type="email" class="form-control my-3" id="email" placeholder="사용 할 이메일" name="email">
                        <div class="input-group mb-3">
                          <input type="text" class="form-control" placeholder="이메일" aria-label="이메일" aria-describedby="button-addon2">
                          <button class="btn btn-secondary" type="button" id="button-addon2">이메일 발송</button>
                        </div>
                        <div class="input-group mb-3">
                          <input type="text" class="form-control" placeholder="이메일 인증" aria-label="이메일 인증" aria-describedby="button-addon2">
                          <button class="btn btn-secondary" type="button" id="button-addon2">확인</button>
                        </div>
                        <input type="password" class="form-control my-3" id="email" placeholder="비밀번호" name="pwd">
                        <input type="password" class="form-control my-3" id="email" placeholder="비밀번호 확인" name="pwd">
                        <input type="text" class="form-control my-3" id="name" placeholder="닉네임" name="name">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-dark">가입하기</button>
                        <button type="button" class="btn btn-dark" data-bs-dismiss="modal">취소하기</button>
                    </div>

            </div>
        </div>
    </div>


  
  </body>
  
</html>