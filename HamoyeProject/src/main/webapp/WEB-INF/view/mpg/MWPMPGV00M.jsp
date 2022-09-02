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
<script src="js/mypage.js"></script>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>  
$(function(){
	$("#depositBtn").click(function(){ 
		if($("#asd").val() == "") {
			alert('챌린지 계좌가 있어야 입금 가능합니다!');
			$('#makeAccount').focus();
			return false;
		} 
	}); 
}); 
/* window.onload = function(){
			new RollingNum('mypage_balance','${result.account.balance}','slide'); 
} */ 
let isVisible = false; 

window.addEventListener('scroll', function() { 
	if ( checkVisible($('#progressNow')) && !isVisible) {
		isVisible=true;
		$('#progress').animate( { 
			value:'${result.participationCount}'
		}, 1000 ); 
	} 
});
window.onload = function(){
	new RollingNum('mypage_balance','${result.account.balance}','slide'); 
}
/* let isVisiblebal = false; 
window.addEventListener('scroll', function() {
if (checkVisible($('#mypage_balance')) && !isVisiblebal) {
	isVisiblebal=true;
	window.onload = function(){
		new RollingNum('mypage_balance','${result.account.balance}','slide'); 
	}
}
}); */
 
</script>
</head>
<body id="mypage_main_body">
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
	<div id="mypage_wrapper"  class="is-preload mb-5 wow fadeIn" data-wow-delay="0.1s">
				 
		<!-- Nav -->
		<nav id="mypage_nav">
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
		<div id="mypage_main">

		<!-- Introduction -->
		<section id="intro" class="main">
			<div class="spotlight">
					 <c:choose>
						<c:when test="${result.account != null}">  
						<span class="image"><img src="img/img-fpm-bf-31@3x.png" alt="" /></span>
						<div class="content">
						<p class="showAccount">계좌번호 : ${result.account.accountNumber}</p><br> 
							<header id="introText" class="mypage_major" style="display:block"><br>  
								<div class="mypage_account_text">
									<h1 style="color:#2b3886">${userName}</h1>
									<h5>님의</h5>
								</div>
								<div class="mypage_account_text"><br><br><br>
									<h3 style="color:#2b3886">${result.ecoChallenge.ecoChallengeName} </h3>
									<h5> 챌린지 </h5><br><br><br> 
									<h4>원</h4> <h4 id="mypage_balance"></h4> <h4>잔액 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4><br> 
									<h2 />
								</div> 
								<div style="display:inline-flex; flex-wrap:wrap"><br><br><h3>만기시 이자 ${result.account.primeRate} </h3><br><br><br><h3>현재까지의 이자</h3> </div>
							</header>
							<br>
							
                       			</div>
						</c:when>
						<c:otherwise>
						<span class="image"><img src="img/img-fpm-bf-12@3x.png" alt="" /></span>
						<div class="content">
							<header id="introText" class="mypage_major" style="display:block"><br>
								<div class="mypage_account_text">
									<h1 style="color:#2b3886">${userName}</h1>
									<h5>님은</h5>
								</div>
									<div class="mypage_account_text"><br><br><br>
									<h3 style="color:#2b3886">아직, 챌린지 계좌가 없습니다!</h3>
									<h2 />
									</div> 
							</header>
							<br>
									<div id="intro_btn"><br><br><br><br>
										<a id="makeAccount" class="btn btn-outline-primary px-3" href="challege.do" >
	                            		계좌 만들고 챌린지 참여하기!
	                            		<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
	                                		<i class="fa fa-arrow-right"></i>
	                            		</div>
	                       				</a><br><br>
	                       				<a class="btn btn-outline-primary px-3" href="moveToChangeForm.do" >
	                            		회원정보수정
	                            		<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
	                                		<i class="fa fa-arrow-right"></i>
	                            		</div>
                       					</a>
                       				</div> 
							</div>
						</c:otherwise>
					</c:choose> 
				
			</div>
			<div id="intro_btn"><br><br>
										<a class="btn btn-outline-primary px-3" href="moveToChangeForm.do" >
	                            		회원정보수정
	                            		<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
	                                		<i class="fa fa-arrow-right"></i>
	                            		</div>
                       					</a> 
                       					<a class="btn btn-outline-primary px-3" href="moveToAccountOut.do" >
	                            		계좌해지하기
	                            		<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
	                                		<i class="fa fa-arrow-right"></i>
	                            		</div>
                       					</a>
                       				</div>
		</section>
 		 <c:choose>
 			 <c:when test="${result.account != null}">
				<!-- First Section -->
				<section id="first" class="main special">
					<c:choose>
						<c:when test="\${result.ecoChallenge.ecoChallengeName eq 'transportation'}">
							<header class="mypage_major">
								<h2>대중교통이용 챌린지</h2>
							</header>
							<ul class="mypage_features">
								<li>
									<span class="mypage_icon solid mypage_major style1 fa-bus-alt"></span> 
								</li>
								<li>
									<span class="mypage_icon solid mypage_major style3 fa-subway"></span> 
								</li> 
							</ul>
							<h5>현재 함께하는 1,743 명 가운데</h5>
							<h5>629명이 목표달성했어요!</h5>
							<footer class="mypage_major">
								<a class="btn btn-outline-primary px-3" href="challengeDetail.do">
			                         	챌린지 자세히보기
			                            <div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
			                            	<i class="fa fa-arrow-right"></i>
			                            </div>
			                	</a>
											<div><br>
								<h5 id="progressNow" >진행현황</h5> <h4>지금까지 지구를 15번 지켰어요!</h4><br><br>
									<progress class="container" value="50" max="100"  id="progress" style="display:block"></progress>
								</div>
										</footer>
									</c:when>
								<c:otherwise>
										<header class="mypage_major">
											<h2>${result.ecoChallenge.ecoChallengeName} 챌린지</h2>
										</header>
										<ul class="mypage_features">
											<li>
												<span class="mypage_icon solid mypage_major style1 	fas fa-hand-holding-heart"></span> 
											</li>
											<li>
												<span class="mypage_icon solid mypage_major style3 fas fa-globe"></span> 
											</li> 
										</ul>
										<h5>현재 함께하는 ${totalCnt} 명 가운데</h5>
																		<h5>${successCnt}명이 목표달성했어요!</h5>
										<footer class="mypage_major">
											<a class="btn btn-outline-primary px-3" href="challenge.do">
			                            		챌린지 자세히보기
			                            		<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
			                                		<i class="fa fa-arrow-right"></i>
			                            		</div>
			                       			</a><br>
			                       			<p id="progressNow"><b  style="color:gray">진행현황</b></p>
											<div><br><br>
													<div style=" position: relative; height: 40px;">
														<progress class="container" value="0%" max="${result.ecoChallenge.totalCount}"  id="progress"></progress>
		    											<p style="position: absolute; top: 10px; right: 35px; margin-bottom: 10px;">목표횟수 ${result.ecoChallenge.totalCount} 회 중, ${result.participationCount}회 달성! </p>
													</div> 
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
								<header id="introText" class="mypage_major">
									<div >
										<h1>${userName}</h1>
										<h4 >님의</h4> 
									</div>
									<div> <br><br><br>
										<h2>동백포인트 </h2>
										<h4>${result.point.totalPoint} P </h4> <br> <br>
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
								<input id="asd" type="hidden" value = "${result.accountNumber}">
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
								<header class="mypage_major">
									<h1>떠나요 부산!</h1>
									<h2></h2>
									<p>서브챌린지</p>
								</header>
								<ul class="statistics">
									<li><span class="mypage_icon solid mypage_major style3 fas fa-utensils" /></li>
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
									<li><span class="mypage_icon solid mypage_major style5 far fa-user-circle" /></li>
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