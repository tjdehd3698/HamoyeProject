<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>하모예-지구를지켜요 가입하기</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

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

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
 <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

  <!-- Page Header Start -->
    <div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center">
            <h1 class="display-4 text-white animated slideInDown mb-4">Challenge Sing Up</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Team Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">가입하기</div>
                <h1 class="display-6 mb-5">지구를 지켜요</h1>
            </div>
			<article align="center">
			<section>
			<h2><b>지구를 지키기 위한 "한 걸음"</b></h2>
				챌린지에 가입하기 위해 개인 정보를 확인해주세요
			</section><br><br><br>
			<form>
            	<div class="row g-3">
                	<div class="col-md-6">
                		<div class="form-floating">
               				<input type="text" class="form-control" id="name" placeholder="이름">
                			<label for="name">이름</label>
                		</div>
                     </div>
                     <div class="col-md-6">
                     	<div class="form-floating">
                        	<input type="id" class="form-control" id="email" placeholder="아이디">
                            <label for="id">아이디</label>
                        </div>
                     </div>
                	<div class="col-md-6">
                		<div class="form-floating">
               				<input type="text" class="form-control" id="gender" placeholder="성별">
                			<label for="gender">성별</label>
                		</div>
                     </div>
                     <div class="col-md-6">
                     	<div class="form-floating">
                        	<input type="id" class="form-control" id="birthday" placeholder="생년월일">
                            <label for="birthday">생년월일</label>
                        </div>
                     </div>
                     <div class="col-12">
                     	<div class="form-floating">
                     		<input type="text" class="form-control" id="email" placeholder="이메일">
                     		<label for="email">이메일</label>
                     	</div>
                     </div>
                      <div class="col-12">
                     	<div class="form-floating">
                     		<input type="text" class="form-control" id="address" placeholder="주소">
                     		<label for="address">주소</label>
                     	</div>
                     </div>
                     <br>
                     	챌린지에 참여하기 위해 부산은행 계좌를 개설할게요
                     <br>
                     <div class="col-12">
                     	<div class="form-floating">
                     		<input type="text" class="form-control" id="purpose" placeholder="계좌개설목적">
                     		<label for="purpose">계좌개설목적</label>
                     	</div>
                     </div>
                     <div class="col-12">
                     	<div class="form-floating">
                     		<input type="text" class="form-control" id="incomeSource" placeholder="수입원">
                     		<label for="incomeSource">수입원</label>
                     	</div>
                     </div>
                     
                 
                     <!-- 정보입력하기 누르면 다음페이지는 약관동의 페이지입니당 -->
                     <div class="col-12">
                     	<button class="btn btn-primary py-2 px-3 me-3">
                      		챌린지 가입하기
                     		<div class="d-inline-flex btn-sm-square bg-white text-primary rounded-circle ms-2">
                     		<i class="fa fa-arrow-right"></i>
                     </div>
                     </button>
                  	</div>
                 </div>
              </form>

        </div>
    </div>
    <!-- Team End -->

  
 <jsp:include page="/footer.jsp"></jsp:include>

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/parallax/parallax.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>