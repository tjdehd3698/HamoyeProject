<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>하모예-대중교통챌린지</title>
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
                <h1 class="display-6 mb-5">대중교통 이용 챌린지</h1>
            </div>
			<article class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s">
			<section class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s">
			<h2><b>지구, 쉽게 지킬 수 있어요</b></h2>
				대중교통을 이용해보세요<br>
				1주일에 한번, 1년이면 <span style="color: green">소나무 72그루</span>를 심는 것과 같아요
			</section><br><br>
			<section class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s">
			<h2><b>지구는 지금</b></h2>
				심각해지는 기후위기에 아파하고 있어요
			</section>
			<br>
 			<div class="row g-4">
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="team-item position-relative rounded overflow-hidden">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="https://newsimg.hankookilbo.com/cms/articlerelease/2021/07/28/11b7fb6c-21bb-40c1-9380-b2d0b1bda742.jpg" alt="">
                        </div>
                        <div class="team-text bg-light text-center p-4">
                            <h5>2019-20 호주 산불</h5>
                            <p class="text-primary">건조함으로 산불 발생</p>
                            <div class="team-social text-center">
                           		2019년 호주에서 발생한 산불은 <br> 6개월동안 호주 숲의 14%를 태웠어요
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="team-item position-relative rounded overflow-hidden">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="http://image.dongascience.com/Photo/2020/04/15875301503149.jpg" alt="">
                        </div>
                        <div class="team-text bg-light text-center p-4">
                            <h5>빙하가 사라지는 북극</h5>
                            <p class="text-primary">온난화로 인한 빙하 소실</p>
                            <div class="team-social text-center">
                                 	북극의 여름에는 이제 얼음이 없어요<br>북극곰은 어디로 가야할까요
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="team-item position-relative rounded overflow-hidden">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="https://thumb.mt.co.kr/06/2022/08/2022080908264831583_1.jpg/dims/optimize/" alt="">
                        </div>
                        <div class="team-text bg-light text-center p-4">
                            <h5>2022년 서울 폭우</h5>
                            <p class="text-primary">이상기후로 인한 폭우</p>
                            <div class="team-social text-center">
                                	105년만의 기록적인 폭우로 <br> 서울도심이 물에 잠겼어요
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                    <div class="team-item position-relative rounded overflow-hidden">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="https://menu.mt.co.kr/moneyweek/thumb/2021/08/29/06/2021082911458043292_1.jpg" alt="">
                        </div>
                        <div class="team-text bg-light text-center p-4">
                            <h5>미국의 허리케인</h5>
                            <p class="text-primary">거대 허리케인의 빈번화</p>
                            <div class="team-social text-center">
                                	허리케인이 더 자주, 더 크게 발생해요 <br>이제는 이름도 짓기가 힘들어요
                            </div>
                        </div>
                    </div>
                </div>
              </div>
			  <div>
			  <br><br><br>
				주 3회 이상 대중교통을 이용하여 온실가스 배출을 줄여보세요<br>
				환경을 지키고 생명을 구하는 일<br>
				<b>당신도 할 수 있어요</b> <br>
			</div>
			<br><br>
			<div>
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