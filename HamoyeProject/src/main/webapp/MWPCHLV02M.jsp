<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>하모예-봉사활동챌린지</title>
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
            <h1 class="display-4 text-white animated slideInDown mb-4">Challenge Information</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Team Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">지구를 지켜요</div>
                <h1 class="display-6 mb-5">봉사활동 참여 챌린지</h1>
            </div>
			<article class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s">
			<section class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s">
			<h2><b>함께, 노력해봐요</b></h2>
				<span>부산은행과 함께하는</span>
				봉사활동에 참여해보세요<br>
				여러 사람들과 다양한 활동을 함께해요
			</section><br><br>
			<section class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s">
			<h2><b>부산은행은 지금</b></h2>
				지구를 지키기 위해 많은 일을 하고 있어요<br>
				작은 손길이 모여 커다란 힘이 된 현장
			</section>
			<br><br>
 			<div class="row g-4">
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="team-item position-relative rounded overflow-hidden">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="http://www.happybnk.co.kr/upload/141/2848/%EB%A6%AC%ED%94%8C(Re%20Plastic)%EC%BA%A0%ED%8E%98%EC%9D%B81.jpg" alt="">
                        </div>
                        <div class="team-text bg-light text-center p-4">
                            <h5>ESG 실천 캠페인</h5>
                            <p class="text-primary">2021년 6월</p>
                            <div class="team-social text-center">
                                	ESG에 대한 관심을 모으기 위해 <br>
                                	‘리플(Re:Plastic) 캠페인’을 진행했어요
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="team-item position-relative rounded overflow-hidden">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="http://www.happybnk.co.kr/upload/141/2362/%ED%99%98%EA%B2%BD%EC%A0%95%ED%99%94%ED%99%9C%EB%8F%99%20%EC%82%AC%EC%A7%842.jpg" alt="">
                        </div>
                        <div class="team-text bg-light text-center p-4">
                            <h5>환경정화 운동</h5>
                            <p class="text-primary">2019년 8월</p>
                            <div class="team-social text-center">
                                	해양 생태계를 지키기 위해 <br>
                                	해변가 환경 정화운동을 했어요
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="team-item position-relative rounded overflow-hidden">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="http://www.happybnk.co.kr/upload/141/1736/20160420_%EA%B8%B4%EA%B8%89%EC%9E%AC%EB%82%9C%EA%B5%AC%ED%98%B8%EB%B4%89%EC%82%AC%ED%99%9C%EB%8F%99%20%EC%8B%A4%EC%8B%9C.jpg" alt="">
                        </div>
                        <div class="team-text bg-light text-center p-4">
                            <h5>영도 화물선 좌초 기름 제거</h5>
                            <p class="text-primary">2016년 4월</p>
                            <div class="team-social text-center">
                                	좌초된 ‘오션탱고호(3525t)’에서 유출된 <br>기름띠 제거 봉사활동을 함께했어요
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                    <div class="team-item position-relative rounded overflow-hidden">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="http://www.happybnk.co.kr/upload/141/407/2014.12.13%20%EB%82%99%EB%8F%99%EA%B0%95%ED%95%98%EA%B5%AC%20%EA%B2%A8%EC%9A%B8%EC%B2%A0%EC%83%88%20%EB%A8%B9%EC%9D%B4%EC%A3%BC%EA%B8%B0%20%EB%B0%8F%20%ED%99%98%EA%B2%BD%EC%A0%95%ED%99%94.jpg" alt="">
                        </div>
                        <div class="team-text bg-light text-center p-4">
                            <h5>겨울철새 먹이주기</h5>
                            <p class="text-primary">2014년 12월</p>
                            <div class="team-social text-center">
                                	낙동강 하구에 찾아오는 철새를 위해<br>먹이를 주고 환경정화를 했어요
                            </div>
                        </div>
                    </div>
                </div>
              </div>
              <br><br><br>
              <div>
              	지구를 지키기 위한 부산은행의 노력에<br>
              	<b>당신의 힘이 필요해요</b>
              	<br><br>
              </div>
			<div align="center">
				<h3>지구를 지키는 당신에게 <br>매년 0.5%의 이자를 더 드려요</h3><br><br>
			 	<a class="btn btn-outline-primary px-3" href="/MWPCHLV10M.jsp" >
                                       챌린지 참여하고 우대이율 받기
             		<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
                		<i class="fa fa-arrow-right"></i>
                	</div>
             	</a>
            </div>
		</article>
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