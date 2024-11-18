<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js" integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>
        div > img{
            margin-left:24% ;
            width: 50%;
            height: 50%;
        }
    </style>
</head>
    
<body style="background-color: #000;">

    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        회원가입
    </button>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin-top :10%;">
        <div class="modal-dialog">
            <div class="modal-content" style="background-color: #000;">
                <div class="modal-header">
                    <img src="-2024-11-14--7.59.32.jpg">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                    <button type="button" class="btn-close btn btn-light" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                    <div class="modal-body">
                        <input type="email" class="form-control my-3" id="email" placeholder="사용 할 이메일" name="email">
                        <input type="text" class="form-control my-3" id="number" placeholder="인증번호" name="num"><button class="btn btn-primary">인증번호 발송</button>
                        <input type="email" class="form-control my-3" id="email" placeholder="이메일 인증" name="email">
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

    <script>
        $("button").click(function(){
            $("body").click(function(){
                $("body").css("backgroundColor",'#8c8c8c');
            });
        });

    </script>
</body>
</html>