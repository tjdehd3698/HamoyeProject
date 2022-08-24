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
			<h2><b>서약서 작성하기</b></h2>
				챌린지에 가입하기 위해 서약서를 작성해주세요
				<br><br>
			<article style="border: 1px solid #2b3886">
				<h4>서약서</h4>
				<section>
					나, 챌린지 참여자 000은 거짓없이 성실하게 챌린지에 참여할 것을 다짐하면서 다음과 같이 서약합니다.
						<br><br>
					1. 챌린지에 참여하여 환경을 지키는데 앞장설 것입니다.<br>
					2. 진행중인 챌린지 이외에도 환경을 보호하기 위해 행동하겠습니다. <br>
					3. 선한 영향력을 위하여 챌린지를 홍보하는데 앞장서겠습니다.<br>
					4. 보상을 위해 허위로 결과를 조작하지 않을 것입니다.<br>
					5. 서약서를 작성함으로써, 챌린지 이외에 0.5%의 우대이율을 추가로 제공받는데 동의합니다.<br>
					<br><br>
					20XX년 XX월 XX일<br>
					챌린지 참여자 &nbsp;<h6 style="display:inline">000</h6>  &nbsp;(인)
				</section>
			</article>
				<br>
			<div class="col-12">
            	<button class="btn btn-primary py-2 px-3 me-3">
                 	서약서 제출하기
                	<div class="d-inline-flex btn-sm-square bg-white text-primary rounded-circle ms-2">
                    <i class="fa fa-arrow-right"></i>
                     </div>
                 </button>
            </div>
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