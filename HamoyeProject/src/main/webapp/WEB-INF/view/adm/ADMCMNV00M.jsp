<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>HAMOYE 관리자 로그인</title>

    <!-- Custom fonts for this template-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
	<link href="css/sb-admin-2.css" rel="stylesheet">
</head>
<body class="bg-gradient-primary" style="background-image: linear-gradient(180deg, #ffffff 10%, #f9f9f9 100%);">

    <div class="container">
        <!-- Outer Row -->
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">HAMOYE 관리자 로그인</h1>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user"
                                            id="userId" placeholder="ID" required="required">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user"
                                            id="userPassword" placeholder="Password" required="required">
                                    </div>
<!--                                         <div class="form-group"> -->
<!--                                             <div class="custom-control custom-checkbox small"> -->
<!--                                                 <input type="checkbox" class="custom-control-input" id="customCheck"> -->
<!--                                                 <label class="custom-control-label" for="customCheck">Remember -->
<!--                                                     Me</label> -->
<!--                                             </div> -->
<!--                                         </div> -->
                                    <hr>
                                    <button type="submit" class="btn btn-primary btn-user btn-block" id="login">
                                        Login
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript-->
    <script src="js/jquery.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#login").on("click",function(){
			
			var param="";
			param += "&userId=" + $("#userId").val();
			param += "&userPassword=" + $("#userPassword").val();
			
			$.ajax({
				type:'post',
				url:'adminLogin.do',
				data:param,
				
				success:function(result) {
					if(result=="T"){
						window.location.href = "adminIndex.do";
					}else{
						alert("아이디 또는 비밀번호가 일치하지 않습니다.");
					}
				},error:function(){
					alert("다시 시도해주세요.");
				}
			});
			
		})
	});
	</script>
</body>
</html>