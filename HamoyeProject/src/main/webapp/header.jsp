<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
		
		if(document.FrmLogin.userId.value == "") {
			$("#userId").next(".form-text").text("ID를 입력해주세요.");
			document.FrmLogin.userId.focus();
			return false;
		}else{
			$("#userId").next(".form-text").text("");
			param += "&userId=" + document.FrmLogin.userId.value;
		}
		
		if (document.FrmLogin.userPassword.value == "" ) {
			$("#userPassword").next(".form-text").text("비밀번호를 입력해주세요.");
			document.FrmLogin.userPassword.focus();
			return false;
		}else{
			$("#userPassword").next(".form-text").text("");
			param += "&userPassword=" + document.FrmLogin.userPassword.value;
		}
		
		
		$.ajax({
			type:'post',
			url:'login.do',
			data:param,
			
			success:function(result) {
				alert("로그인성공");
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
                        <a href="challege.do" class="dropdown-item">전체보기</a>
                        <a href="#none" class="dropdown-item">지구를 지켜요</a>
                        <a href="#none" class="dropdown-item">챌린지명</a>
                        <a href="#none" class="dropdown-item">챌린지명</a>
                    </div>
                </div>
                <a href="#none" class="nav-item nav-link">마이페이지</a>
            </div>
            <div class="d-none d-lg-flex ms-2">
                <a class="btn btn-outline-secondary py-2 px-3" href="#none" data-bs-toggle="modal" data-bs-target="#loginModal">
                    로그인하기
                    <div class="d-inline-flex btn-sm-square bg-white text-primary rounded-circle ms-2">
                        <i class="fa fa-arrow-right"></i>
                    </div>
                </a>
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
			<form method="post" name="FrmLogin" action="login.do">
				<div class="modal-body">
						<div class="mb-3">
							<label for="userId" class="form-label">ID</label>
							<input type="text" class="form-control" id="userId" tabindex=1 placeholder="아이디를 입력해주세요" required="required">
							<div class="form-text text-primary"></div>
						</div>
						<div class="mb-3">
							<label for="userPassword" class="form-label">Password</label>
							<input type="password" class="form-control" id="userPassword" tabindex=2 placeholder="비밀번호를 입력해주세요" required="required">
							<div class="form-text text-primary"></div>
						</div>
					 	<a href="#" class="stretched-link" style="position: relative;">처음이신가요?</a>
	<!-- 						<div class="mb-3 form-check"> -->
	<!-- 						  <input type="checkbox" class="form-check-input" id="user_check"> -->
	<!-- 						  <label class="form-check-label" for="user_check">Check me out</label> -->
	<!-- 						</div> -->
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