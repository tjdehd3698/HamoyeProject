<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">
<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Saira:wght@500;600;700&display=swap" rel="stylesheet"> 

<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<!-- Template Stylesheet -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"> -->
<link href="css/mwp.css" rel="stylesheet">

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script> -->
<script src="lib/wow/wow.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/parallax/parallax.min.js"></script>


<!-- Template Javascript -->
<script src="js/main.js"></script>

<script type="text/javascript">
$(function(){
	$("#login").on("click",function(){
		var param="";
		
		if(document.FrmLogin.loginId.value == "") {
			$("#loginId").next(".form-text").text("ID를 입력해주세요.");
			document.FrmLogin.loginId.focus();
			return false;
		}else{
			$("#loginId").next(".form-text").text("");
			param += "&userId=" + document.FrmLogin.loginId.value;
		}
		
		if (document.FrmLogin.loginPassword.value == "" ) {
			$("#loginPassword").next(".form-text").text("비밀번호를 입력해주세요.");
			document.FrmLogin.loginPassword.focus();
			return false;
		}else{
			$("#loginPassword").next(".form-text").text("");
			param += "&userPassword=" + document.FrmLogin.loginPassword.value;
		}
		
		$.ajax({
			type:'post',
			url:'login.do',
			data:param,
			
			success:function(result) {
				if(result=="T"){
					window.location.href = "home.do";
				}else{
					alert("아이디 또는 비밀번호가 일치하지 않습니다.");
				}
			},error:function(){
				alert("다시 시도해주세요.");
			}
		});
		
		//document.FrmLogin.submit();
		
	})
});
</script>
<!-- Navbar Start -->
<div class="container-fluid fixed-top px-0 wow fadeIn" data-wow-delay="0.1s">
    <div class="top-bar text-white-50 row gx-0 align-items-center d-none d-lg-flex">
        <div class="col-lg-6 px-5 text-start">
            <small><i class="fa fa-map-marker-alt me-2"></i>부산광역시 남구 문현금융로 30</small>
            <small class="ms-4"><i class="fa fa-envelope me-2"></i>hamoye@busanbank.com</small>
        </div>
        <div class="col-lg-6 px-5 text-end">
            <small>Follow us:</small>
            <a class="text-white-50 ms-3" href="https://ko-kr.facebook.com/busanbank"><i class="fab fa-facebook-f"></i></a>
            <a class="text-white-50 ms-3" href="https://twitter.com/busanbank"><i class="fab fa-twitter"></i></a>
            <a class="text-white-50 ms-3" href="https://www.instagram.com/bnk_busanbank"><i class="fab fa-instagram"></i></a>
            <a class="text-white-50 ms-3" href="https://www.youtube.com/channel/UCI9iMwrvrLYqfDeBL4al_HA"><i class="fab fa-youtube"></i></a>
        </div>
    </div>

    <nav class="navbar navbar-expand-lg navbar-dark py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
        <a href="home.do" class="navbar-brand ms-4 ms-lg-0">
            <h1 class="fw-bold text-primary m-0">HA<span class="text-white">MOYE</span></h1>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
            
                <a href="home.do?param=intro" class="nav-item nav-link">서비스 소개</a><!-- active -->
                <div class="nav-item dropdown">
                    <a href="#none" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">챌린지</a>
                    <div class="dropdown-menu m-0">
                        <a href="challenge.do" class="dropdown-item">전체보기</a>
                        <a href="#none" class="dropdown-item">지구를 지켜요</a>
                        <a href="#none" class="dropdown-item">챌린지명</a>
                        <a href="#none" class="dropdown-item">챌린지명</a>
                    </div>
                </div>
                <c:if test="${!empty userName}">
	                <a href="mypage.do" class="nav-item nav-link">마이페이지</a>
                </c:if>
            </div>
            <div class="d-none d-lg-flex ms-2">
		        <c:choose>
					<c:when test="${!empty userName}">
						<a class="btn btn-outline-secondary py-2 px-3" href="logout.do">
		                    로그아웃
		                    <div class="d-inline-flex btn-sm-square bg-white text-primary rounded-circle ms-2">
		                        <i class="fa fa-arrow-right"></i>
		                    </div>
		                </a>
					</c:when>
					<c:otherwise>
		                <a class="btn btn-outline-secondary py-2 px-3" href="#none" data-bs-toggle="modal" data-bs-target="#loginModal">
		                    로그인하기
		                    <div class="d-inline-flex btn-sm-square bg-white text-primary rounded-circle ms-2">
		                        <i class="fa fa-arrow-right"></i>
		                    </div>
		                </a>
					</c:otherwise>
				</c:choose>
            </div>
        </div>
    </nav>
</div>
<!-- Navbar End -->

<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModal" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		 <div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title text-center" id="modalTitle">
					<strong class="fw-bold text-primary m-0">HA</strong>MOYE
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form method="post" name="FrmLogin">
				<div class="modal-body">
						<div class="mb-3">
							<label for="loginId" class="form-label">ID</label>
							<input type="text" class="form-control" id="loginId" tabindex=1 placeholder="아이디를 입력해주세요" required="required">
							<div class="form-text text-primary"></div>
						</div>
						<div class="mb-3">
							<label for="loginPassword" class="form-label">Password</label>
							<input type="password" class="form-control" id="loginPassword" tabindex=2 placeholder="비밀번호를 입력해주세요" required="required">
							<div class="form-text text-primary"></div>
						</div>
					 	<a href="agree.do" class="stretched-link" style="position: relative;">처음이신가요?</a>
					 	<span class="login-partition"></span>
					 	<a href="findPasswordPage.do" class="stretched-link" style="position: relative;">비밀번호를 잊으셨나요?</a>
			    </div>
			    <div class="modal-footer">
			<!-- 				<button type="button" class="btn btn-secondary btn-lg">회원가입</button> -->
					<button type="button" class="btn btn-primary btn-lg" id="login">로그인</button>
					
				</div>
			</form>
		</div>
	</div>
</div>
<!-- //Modal -->