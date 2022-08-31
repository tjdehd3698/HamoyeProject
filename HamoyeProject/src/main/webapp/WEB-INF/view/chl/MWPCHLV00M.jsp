<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
    <title>하모예-챌린지 리스트</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
 <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    <!-- Page Header Start -->
    <div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center">
            <h1 class="display-4 text-white animated slideInDown mb-4">Challenge List</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->

    <!-- Service Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">Now On</div>
<<<<<<< HEAD
                       <h1 class="display-6 mb-5">챌린지에 도전해보세요</h1>
                </div>
                <div class="row g-4 justify-content-center">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="service-item bg-white text-center h-100 p-4 p-xl-5">
                            <img class="img-fluid mb-4" src="img/free-icon-earth-globe-921423.png" width="90px" height="90px">
                            <h4 class="mb-3">지구를 지켜요</h4>

                             <c:forEach var="ecoChallenge" items="${ecoChallengeList}">
                                <div class="mb-4"><b> ${ecoChallenge.ecoChallengeName}하고 </b><br>
                                    <a class="btn btn-outline-primary px-3" href="challengeDetail.do/${ecochallenge.ecoChallengeId}">
                                        이자 더 받기
                                        <div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
                                        <i class="fa fa-arrow-right"></i>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
=======
               		<h1 class="display-6 mb-5">챌린지에 도전해보세요</h1>
            	</div>
            	<div class="row g-4 justify-content-center">
                	<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    	<div class="service-item bg-white text-center h-100 p-4 p-xl-5">
                        	<img class="img-fluid mb-4" src="img/free-icon-earth-globe-921423.png" width="90px" height="90px">
                        	<h4 class="mb-3">지구를 지켜요</h4>
                        	
                         	<c:forEach var="ecoChallenge" items="${ecoChallengeList}">
                        		<div class="mb-4"><b> ${ecoChallengeName}하고 </b><br>
                        			<a class="btn btn-outline-primary px-3" href="challengeDetail.do/${ecochallenge.challengeId}">
                            			이자 더 받기
                            			<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
                                		<i class="fa fa-arrow-right"></i>
                            			</div>
                        			</a>
                        		</div>
                        	</c:forEach>
>>>>>>> branch 'main_test' of https://github.com/tjdehd3698/HamoyeProject
                    </div> 
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="service-item bg-white text-center h-100 p-4 p-xl-5">
                        <img class="img-fluid mb-4" src="img/beach.png" alt="" width="90px" height="90px">
                        <h4 class="mb-3">떠나요 부산</h4>
                         <c:forEach var="tripChallenge" items="${tripChallengeList}">
                                <div class="mb-4"><b> ${tripChallenge.tripChallengeName}하고 </b><br>
                                    <a class="btn btn-outline-primary px-3" href="challengeDetail.do/${tripChallenge.tripChallengeId}">
                                        동백포인트 받기 
                                        <div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
                                        <i class="fa fa-arrow-right"></i>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="service-item bg-white text-center h-100 p-4 p-xl-5">
                        <img class="img-fluid mb-4" src="img/social-media.png" alt="" width="90px" height="90px">
                        <h4 class="mb-3">이런 챌린지 어때요?</h4>
                        <div class="mb-4"><b>요즘 핫해요</b></div>
                        <div style="padding:5px">
                        <a class="btn btn-outline-primary px-3" href="">
                                대중교통 챌린지
                            <div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
                                <i class="fa fa-arrow-right"></i>
                            </div>
                        </a>
                        </div>
                        <div style="padding:5px">
                        <a class="btn btn-outline-primary px-3" href="">
                                오늘의 식당 방문 챌린지
                            <div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
                                <i class="fa fa-arrow-right"></i>
                            </div>
                        </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Service End -->

    <!-- Testimonial Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">Last</div>
                <h1 class="display-6 mb-5">지난 챌린지</h1>
            </div>
            <div class="owl-carousel testimonial-carousel wow fadeInUp" data-wow-delay="0.1s">
                <div class="testimonial-item text-center">
                    <img class="img-fluid bg-light rounded-circle p-2 mx-auto mb-4" src="img/free-icon-earth-globe-921423.png" style="width: 100px; height: 100px;">
                    <div class="testimonial-text rounded text-center p-4">
                        지난 챌린지1
                    </div>
                </div>
                <div class="testimonial-item text-center">
                    <img class="img-fluid bg-light rounded-circle p-2 mx-auto mb-4" src="img/free-icon-earth-globe-921423.png" style="width: 100px; height: 100px;">
                    <div class="testimonial-text rounded text-center p-4">
                        지난 챌린지2
                    </div>
                </div>
                <div class="testimonial-item text-center">
                    <img class="img-fluid bg-light rounded-circle p-2 mx-auto mb-4" src="img/beach.png" style="width: 100px; height: 100px;">
                    <div class="testimonial-text rounded text-center p-4">
                        지난 챌린지3
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Testimonial End -->

 <jsp:include page="../footer.jsp"></jsp:include>

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>