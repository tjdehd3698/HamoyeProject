<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하모예 - 마이페이지</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
 
<script type="text/javascript">
$(function() {
	$('#depositBtn').click(function () { 
    	if(${result.account != null}){
    		return ;
    	}else{
    		alert('챌린지 계좌가 있어야 입금 가능합니다!');  
    		$('#makeAccount').focus();
    		return false;	
    	} 
    });
});
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	
	<!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    <!-- Page Header Start -->
    <div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center">
            <h1 class="display-4 text-white animated slideInDown mb-4">MyPage</h1>
            <nav aria-label="breadcrumb animated slideInDown" />
        </div>
    </div>
    <!-- Page Header End --> 
		
	<!-- Wrapper -->
	<div id="wrapper"  class="is-preload mb-5 wow fadeIn" data-wow-delay="0.1s">
				 
		<!-- Nav -->
		<nav id="nav">
			<ul>
				<li><a href="#intro" class="active">계좌정보</a></li>
				<c:choose>
					<c:when test="${result.account != null}">
				<li><a href="#first">메인챌린지</a></li>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose> 
				<li><a href="#second">동백포인트정보</a></li>
				<li><a href="#cta">서브챌린지</a></li>
			</ul>
		</nav>

		<!-- Main -->
		<div id="main">

		<!-- Introduction -->
		<section id="intro" class="main">
			<div class="spotlight">
				<span class="image"><img src="img/carousel-1.png" alt="" /></span>
				<div class="content">
					 <c:choose>
						<c:when test="${result.account != null}">
							<header id="introText" class="major" style="display:block"><br>
								<div class="mypage_account_text">
									<h1>${userName}</h1>
									<h4 >님의</h4>
								</div>
								<div class="mypage_account_text"><br><br><br>
									<h2>${result.ecoChallenge.ecoChallengeName} </h2>
									<h4> 계좌 </h4><br>
								</div>
							</header>
							<p class="showAccount">계좌번호 : ${result.account.accountNumber}</p> <br>
							<h2 class="showPrice">잔액 : ${result.account.balance}</h2> <br>
						</c:when>
						<c:otherwise>
							<header id="introText" class="major" style="display:block"><br>
								<div>
									<h1>${userName}</h1>
									<h4 >님은</h4>
								</div>
								<div><br><br><br><br>
									<h2>아직, 챌린지 계좌가 없습니다!</h2><br><br><br><br>
									<div id="intro_btn">
										<a id="makeAccount" class="btn btn-outline-primary px-3" href="challege.do" >
	                            		계좌 만들고 챌린지 참여하기!
	                            		<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
	                                		<i class="fa fa-arrow-right"></i>
	                            		</div>
	                       				</a><br><br>
	                       				<a class="btn btn-outline-primary px-3" href="challege.do" >
	                            		회원정보수정
	                            		<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
	                                		<i class="fa fa-arrow-right"></i>
	                            		</div>
                       					</a>
                       				</div>
								</div>
							</header>	
						</c:otherwise>
					</c:choose> 
				</div>
			</div>
		</section>
 		<c:choose>
 			<c:when test="${result.account != null}">
				<!-- First Section -->
				<section id="first" class="main special">
					<c:choose>
						<c:when test="\${result.ecoChallenge.ecoChallengeName eq 'transportation'}">
							<header class="major">
								<h2>대중교통이용 챌린지</h2>
							</header>
							<ul class="features">
								<li>
									<span class="icon solid major style1 fa-bus-alt"></span> 
								</li>
								<li>
									<span class="icon solid major style3 fa-subway"></span> 
								</li> 
							</ul>
							<h5>현재 함께하는 1,743 명 가운데</h5>
							<h5>629명이 목표달성했어요!</h5>
							<footer class="major">
								<ul class="actions special">
									<li><a href="challengeDetail.do" class="button">챌린지 자세히 보기</a></li>
								</ul>
								<div >
								<h5 id="progressNow" >진행현황</h5> <h4>지금까지 지구를 15번 지켰어요!</h4><br><br>
									<progress class="container" value="50" max="100"  id="progress" style="display:block"></progress>
								</div>
										</footer>
									</c:when>
								<c:otherwise>
										<header class="major">
											<h2>BNK 봉사활동 챌린지</h2>
										</header>
										<ul class="features">
											<li>
												<span class="icon solid major style1 	fas fa-hand-holding-heart"></span> 
											</li>
											<li>
												<span class="icon solid major style3 fas fa-globe"></span> 
											</li> 
										</ul>
										<h5>현재 함께하는 ${totalCnt} 명 가운데</h5>
																		<h5>${successCnt}명이 목표달성했어요!</h5>
										<footer class="major">
											<ul class="actions special">
												<li><a href="MWPCHLV02M.jsp" class="button">챌린지 자세히 보기</a></li>
											</ul>
											<div >
											<h5 id="progressNow" >진행현황</h5> <h4>어려운 이웃을 5번 도와주었어요!</h4><br><br>
												<progress class="container" value="50" max="100"  id="progress" style="display:block"></progress>
											</div>
										</footer> 
								 	</c:otherwise>
								</c:choose> 
							</section>
							</c:when>
							<c:otherwise> 
							</c:otherwise>
				</c:choose> 
							 
						<!-- Second Section -->
							<section id="second" class="main special">
							<div class="spotlight">
							<span class="img"><img id ="img" src="img/unnamed.png" alt="" /></span>
								<div class="content">
								<header id="introText" class="major">
									<div >
										<h1>${userName}</h1>
										<h4 >님의</h4> 
									</div>
									<div >
										<br><br><br>
										<h2>동백포인트 </h2>
										<h4>${result.point.totalPoint} P </h4>
										<br>
										<br>
									</div>
								</header>
								<div><br><br><br>
								<h5 id="text">언제, 어떻게, 얼마나 모았는지</h3>
								<a class="btn btn-outline-primary px-3" href="showpoint.do">
                            		내역조회하기
                            		<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
                                		<i class="fa fa-arrow-right"></i>
                            		</div>
                       			</a>
                       			</div>
                       			<br><br>
                       			<div>
                       			<br><br>
                       			<h5 id="text">5,000 P 이상 모았다면 </h3>		
                       			<a id="depositBtn" class="btn btn-outline-primary px-3" href="moveDeposit.do" >
                            		계좌입금하기
                            		<div  class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
                                		<i class="fa fa-arrow-right"></i>
                            		</div>
                       			</a>
                       			</div>
								 
								</div>
								</div>
							</section>

						<!-- Get Started -->
							<section id="cta" class="main special">
								<header class="major">
									<h1>떠나요 부산!</h1>
									<h2></h2>
									<p>서브챌린지</p>
								</header>
								<ul class="statistics">
									<li><span class="icon solid major style3 fas fa-utensils" /></li>
									<li>
										<h2>오늘의 식당</h2>
										<h5>맛있게 밥 먹고 포인트 쌓기!</h5>
									</li>
									<li>
										<a class="btn btn-outline-primary px-3" href="MWPCHLV03M.jsp" >
                            				200원 받기
                            				<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
                                				<i class="fa fa-arrow-right"></i>
                            				</div>
                       					</a>
									</li>	
								</ul>
								<ul class="statistics">
									<li><span class="icon solid major style5 far fa-user-circle" /></li>
									<li>
										<h2>오늘의 인물</h2>
										<h5>소상공인 홍보보고 포인트 쌓기!</h5>
									</li>
									<li>
										<a class="btn btn-outline-primary px-3" href="MWPCHLV04M.jsp" >
                            				300원 받기
                            				<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
                                			<i class="fa fa-arrow-right"></i>
                            				</div>
                       					</a>
									</li>	
								</ul>
								  
								<footer class="major">
									<ul class="actions special">
										<li><a href="generic.html" class="button primary">Get Started</a></li>
										<li><a href="generic.html" class="button">Learn More</a></li>
									</ul>
								</footer>
							</section>

					</div> 
			</div>
 
 <jsp:include page="../footer.jsp"></jsp:include>

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