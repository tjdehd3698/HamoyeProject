<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도전을 통해 만들어가는 실천금융, HAMOYE입니다.</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<script>
		$(function(){
		    // Causes progress
		    $('.causes-progress').waypoint(function () {
		        $('.progress .progress-bar').each(function () {
		            $(this).css("width", $(this).attr("aria-valuenow") + '%');
		        });
		    }, {offset: '100%'});
		    
		    var param = getParameterByName('param');
			
		    setTimeout(function(){
			    if(param=="intro"){
				    $('html').animate({scrollTop : $("#intro").offset().top-70}, 1000);
			    }
		    },1200)
		});
		
		function getParameterByName(name) {
			name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
			var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
			results = regex.exec(location.search);
			return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		}
	</script>
	<!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- //Spinner End -->
    
   <!-- Carousel Start -->
    <div class="container-fluid p-0 mb-5" id="index_area">
        <div id="header-carousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="img/carousel-1.png" alt="Image">
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8 pt-5">
                                    <h1 class="display-4 text-white mb-3 animated slideInDown">일상 속 작은 실천, 금융이 되다<br>실천금융 하모예</h1>
                                    <p class="fs-5 text-white-50 mb-5 animated slideInDown">새로운 금융의 시작, 하모예는 실천에서 그 의미를 찾았습니다.</p>
                                    <c:choose>
										<c:when test="${!empty userName}">
											${userName}님, 함께 해주셔서 감사드려요😍<br> - 하모예 드림
										</c:when>
										<c:otherwise>
		                                    <button type="button" class="btn btn-outline-secondary py-2 px-3 animated slideInDown" data-bs-toggle="modal" data-bs-target="#loginModal">
		                                        함께 하기
		                                        <div class="d-inline-flex btn-sm-square bg-white text-primary rounded-circle ms-2">
		                                            <i class="fa fa-arrow-right"></i>
		                                        </div>
		                                    </button>
										</c:otherwise>
									</c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="img/carousel-2.png" alt="Image">
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8 pt-5">
                                    <h1 class="display-4 text-white mb-3 animated slideInDown">하고<br>모으고<br>예금하고</h1>
                                    <p class="fs-5 text-white-50 mb-5 animated slideInDown">쉽고 간단한 실천금융, 하모예</p>
                                    <c:choose>
										<c:when test="${!empty userName}">
											${userName}님, 저와 함께 실천해주세요🏃‍♂️<br> - 하모예 드림
										</c:when>
										<c:otherwise>
		                                    <button type="button" class="btn btn-outline-secondary py-2 px-3 animated slideInDown" data-bs-toggle="modal" data-bs-target="#loginModal">
		                                        함께 하기
		                                        <div class="d-inline-flex btn-sm-square bg-white text-primary rounded-circle ms-2">
		                                            <i class="fa fa-arrow-right"></i>
		                                        </div>
		                                    </button>
										</c:otherwise>
									</c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <!-- Carousel End -->


    <!-- About Start -->
    <div class="container-xxl py-5 pb-0" id="intro">
        <div class="container">
	        <div class="wow fadeInUp" data-wow-delay="0.1s">
	            <div class="h-100">
	                <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">About Us</div>
	                <h1 class="display-6 about_tit"> BNK부산은행 새로운 금융의 시작, <br> 하모예는 실천에서 그 의미를 찾았습니다.</h1>
		            <div class="row g-4 justify-content-center">
		                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
							<p class="mb-3">누적 가입자 수</p>
			                <h3 class="display-5 mb-5">700만+</h3>
		                </div>
		                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
			                <p class="mb-3">참여자 수</p>
			                <h3 class="display-5 mb-5">153만+</h3>
		                </div>
		                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
			                <p class="mb-3">환산 가치</p>
			                <h3 class="display-5 mb-5">1조원+</h3>
		                </div>
		            </div>
		             <div class="row g-4 wow fadeInUp" data-wow-delay="0.7s">
		                <p class="mb-0">2022년 8월 기준</p>
		            </div>
	            </div>
	        </div>
        </div>
    </div>
	<svg class="editorial" viewBox="0 24 150 28" preserveAspectRatio="none">
		<defs>
		<path id="gentle-wave" d="M-160 44c30 0 
		   58-18 88-18s
		   58 18 88 18 
		   58-18 88-18 
		   58 18 88 18
		   v44h-352z" />
		 </defs>
		 <g class="parallax">
		  <use xlink:href="#gentle-wave" x="50" y="0" fill="#4579e2"/>
		  <use xlink:href="#gentle-wave" x="50" y="3" fill="#3461c1"/>
		  <use xlink:href="#gentle-wave" x="50" y="6" fill="#2d55aa"/>  
		 </g>
	</svg>
    <!-- About End -->

    <!-- Causes Start -->
    <div class="container-fluid bg-light py-5">
        <div class="container py-5">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 650px;">
                <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">Challenge E</div>
                <h1 class="display-6 mb-4">나에게 필요한 좋은 습관으로<br>지구를 지켜주세요.</h1>
                <p>지구를 지키는 미션에 따라 우대이율이 올라요!</p>
            </div>
            <div class="row g-4 justify-content-center">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="causes-item d-flex flex-column bg-white border-top border-5 border-primary rounded-top overflow-hidden h-100">
                        <div class="text-center p-4 pt-0">
                            <div class="d-inline-block bg-primary text-white rounded-bottom fs-5 pb-1 px-3 mb-4">
                                <small>challenge 1</small>
                            </div>
                            <h5 class="mb-3">대중교통 이용</h5>
                            <p>12개월간 대중교통 240회 이상 이용</p>
                            <div class="causes-progress bg-light p-3 pt-2">
                                <div class="d-flex justify-content-between">
                                    <p class="text-dark">0 <small class="text-body">회</small></p>
                                    <p class="text-dark">240 <small class="text-body">회</small></p>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
                                        <span>3%</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="position-relative mt-auto">
                            <img class="img-fluid" src="img/main-chl-1.png" alt="">
                            <div class="causes-overlay">
                            	<a class="btn btn-outline-secondary" href="http://127.0.0.1:8899/challengeDetail.do?challengeType=eco&challengeId=eco2">
                                    자세히보기
                                    <div class="d-inline-flex btn-sm-square bg-white text-primary rounded-circle ms-2">
                                        <i class="fa fa-arrow-right"></i>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="causes-item d-flex flex-column bg-white border-top border-5 border-primary rounded-top overflow-hidden h-100">
                        <div class="text-center p-4 pt-0">
                            <div class="d-inline-block bg-primary text-white rounded-bottom fs-5 pb-1 px-3 mb-4">
                                <small>challenge 2</small>
                            </div>
                            <h5 class="mb-3">봉사활동 참여</h5>
                            <p>12개월간 부산은행 주최 봉사활동 10회 이상 참여</p>
                            <div class="causes-progress bg-light p-3 pt-2">
                                <div class="d-flex justify-content-between">
                                    <p class="text-dark">0 <small class="text-body">회</small></p>
                                    <p class="text-dark">10 <small class="text-body">회</small></p>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
                                        <span>3%</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="position-relative mt-auto">
                            <img class="img-fluid" src="img/main-chl-2.png" alt="">
                            <div class="causes-overlay">
                                <a class="btn btn-outline-secondary" href="http://127.0.0.1:8899/challengeDetail.do?challengeType=eco&challengeId=eco3">
                                    자세히보기
                                    <div class="d-inline-flex btn-sm-square bg-white text-primary rounded-circle ms-2">
                                        <i class="fa fa-arrow-right"></i>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Causes End -->

    <!-- Service Start -->
    <div class="container-xxl py-5">
        <div class="container py-5">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">Challenge S</div>
                <h1 class="display-6 mb-4">떠나요 부산</h1>
                <p>방문하고, 누를때 마다 얻어지는 동백포인트</p>
            </div>
            <div class="row g-4 justify-content-center">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="service-item bg-white text-center h-100 p-4 p-xl-5">
                        <img class="img-fluid mb-4" src="img/beach.png" width="130px;">
                        <h4 class="mb-3">오늘의 식당 방문하고</h4>
                        <p class="mb-4">부산에는 맛집이 많아요🍴 <br>직접 방문하고 식사지원금을 받아보세요!</p>
                        <a class="btn btn-outline-primary px-3" href="http://127.0.0.1:8899/challengeDetail.do?challengeType=trip&challengeId=trip2">
                            식사지원금 받기
                            <div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
                                <i class="fa fa-arrow-right"></i>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="service-item bg-white text-center h-100 p-4 p-xl-5">
                        <img class="img-fluid mb-4" src="img/social-media.png" width="130px;">
                        <h4 class="mb-3">오늘의 소상공인 만나고</h4>
                        <p class="mb-4">오늘의 소상공인 만나기 챌린지,<br>어떤 분들이 있을까요?👀</p>
                        <a class="btn btn-outline-primary px-3" href="http://127.0.0.1:8899/challengeDetail.do?challengeType=trip&challengeId=trip2">
                            쇼핑지원금 받기
                            <div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
                                <i class="fa fa-arrow-right"></i>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Service End -->

    <!-- container Start -->
    <div class="container-fluid donate my-5 py-5" data-parallax="scroll" data-image-src="img/carousel-1.png">
        <div class="container py-5">
            <div class="row g-5 align-items-center">
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                    <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">Together</div>
                    <h1 class="display-6 text-white mb-5">같은 목표를 가진 사람들과 함께 하니까 끝까지 해낼 수 있어요</h1>
                    <p class="text-white-50 mb-0">도전에 실패해도 괜찮아요.<br>약속만으로도 누릴 수 있는 혜택이 있어요.</p>
                </div>
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                    <div class="h-100 p-5">
                        <div class="row g-3">
                        	<div class="col-12">
                        		<img class="img-fluid mb-4" src="img/main-chl-together.png">
                        	</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- container End -->
    
	<!-- container Start -->
    <div class="container-xxl py-5">
        <div class="container py-5">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s">
                <h1 class="display-6 mb-5">환경과 금융, 지역과 경제<br>그 사이의 조화를 찾는 하모예입니다.</h1>
            </div>
            <div class="row g-4 justify-content-center">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
	                <img class="img-fluid mb-1" src="img/main-bnk-logo.png" width="120px"> 과 함께 
                	<p><b>하고!</b> 도전해보세요. 다양한 챌린지 서비스를 제공합니다.<br>
					   <b>모으고!</b> 일상 속 작은 실천이 모여 동백 포인트를 꽃피울거예요.<br>
					   <b>예금하고!</b> 도전에 성공한 당신에게 혜택 가득한 예금상품을 선물할게요.
					</p>
                </div>
            </div>
        </div>
    </div>
	<!-- container End -->
	
	<!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    
    <!-- Testimonial End -->
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>